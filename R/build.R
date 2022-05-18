library(rvest)
library(here)
library(purrr)
library(stringr)
library(dplyr)
source(here::here("R/chrome.R"))
library(tidyr)
library(dplyr)
library(repurrrsive)
library('rio')
library('arrow')
library(tidyverse)
library('reticulate')
library(data.table)
library(htmlTable)

options(timeout=3600) # download timeout

mkdir = function (dir) {
  if (!dir.exists(dir)) {
    dir.create(dir,recursive=TRUE)
  } 
}

download_file <- function(dest_dir='',url='') {
  f <- file.path(dest_dir,basename(url))
  
  if (!file.exists(f)) {
    download.file(file.path(url),dest=f)
    print(paste0("File downloaded to: ", f))
  } else {
    print(paste0("File exists: ",f))
  }
}

cache_dir <- "cache"
data_dir <- "data"
mkdir(cache_dir)
mkdir(data_dir)
download_url <- "https://open.fda.gov/data/downloads/"


## Downloading pharmacogenomic biomarker data:
start_session()
navigate("https://www.fda.gov/drugs/science-and-research-drugs/table-pharmacogenomic-biomarkers-drug-labeling")
wait_exists("#guidance")
doc_outer_html() |>
  read_html() |>
  html_element("table") |>
  html_table() |>
  dplyr::select("Drug", "Therapeutic Area*", "Biomarker†", "Labeling Sections") |>
  dplyr::rename("Biomarker" = "Biomarker†",
                "Therapeutic_Area" = "Therapeutic Area*",
                "Labeling_Sections" = "Labeling Sections"
  ) |>
  dplyr::mutate(test=str_replace_all(Biomarker,"\n",' '))|>
  dplyr::mutate(Biomarker_rev=str_replace_all(test,"\t",' ')) |>
  dplyr::mutate(Biomarker_rev2=str_replace_all(Biomarker_rev,"    ",'_'))|>
  dplyr::select(-test,-Biomarker,-Biomarker_rev)|>
  dplyr::rename("Biomarker"="Biomarker_rev2")|> 
  write_parquet("data/pharmacogenomic-biomarkers.parquet")


## Nucleic Acid Tests: 
urlNucleicTests='https://www.fda.gov/medical-devices/in-vitro-diagnostics/nucleic-acid-based-tests'
navigate(urlNucleicTests)
wait_exists("#guidance")
outputNucTests=doc_outer_html()|>
  rvest::read_html()|>
  rvest::html_elements("table")|>
  rvest::html_table()
outputNucTests[[1]]|>
  write_parquet("data/NucleicAcidTestsHumanGenetics.parquet")
outputNucTests[[2]]|>
  write_parquet("data/NucleicAcidTestsMicrobial.parquet")

## Diagnostic Devices
urlDiagDevices='https://www.fda.gov/medical-devices/in-vitro-diagnostics/list-cleared-or-approved-companion-diagnostic-devices-in-vitro-and-imaging-tools'
navigate(urlDiagDevices)
wait_exists("#guidance")
DiagDevices=doc_outer_html()|>
  read_html()|>
  html_element("table")|>
  html_table()
DiagDevices|>
  write_parquet("data/ApprovedCompanionDiagnosticDevices.parquet")

## drug fda data
navigate(download_url)
# accept the Disclaimer
click("body > div.ReactModalPortal > div > div > button")
# open up all of the selections
clickAll("button.bg-primary")

# download the files
urls <- doc_outer_html() |>  read_html() |> html_elements("a")
print("Downloading data urls")
urlList<-urls|>
  purrr::keep(function(a) {
    href <- a |> html_attr("href") ;
    grepl("*.zip",href)
  }) |>
  html_attr("href")


## Includes 1000+ drug event files
urlListAllDrugInfo=grep(glob2rx("https://*drug*.zip"), urlList, value = TRUE)

## Includes sample of drug event files
urlListDrugEventInfo=grep(glob2rx("https://*drug*all_other*.zip"), urlList, value = TRUE)
urlCombList=c(grep(glob2rx("*drug-event*"), urlListAllDrugInfo, value = TRUE, invert = TRUE), urlListDrugEventInfo)
fdaInfo='https://download.open.fda.gov/drug/drugsfda/drug-drugsfda-0001-of-0001.json.zip'
urlAllList=c(fdaInfo, urlCombList)

## Filters out drug event files
urlAllList|>
  map(function(url) {
    dirname <- url |> dirname() |> str_replace("https://download.open.fda.gov","")
    download_dir <- paste0(cache_dir,dirname)
    mkdir(download_dir)
    download_file(dest_dir = download_dir,url)
  })

write.table(list.files('cache/drug/label'),"DrugLabelFiles.txt", row.names = FALSE, col.names = FALSE, quote = FALSE)
write.table(list.files('cache/drug/enforcement'),"EnfLabelFiles.txt", row.names = FALSE, col.names = FALSE, quote = FALSE)
write.table(list.files('cache/drug/ndc'),"NDCLabelFiles.txt", row.names = FALSE, col.names = FALSE, quote = FALSE)
write.table(list.files('cache/drug/event/all_other/'),"drugEventFiles.txt", row.names = FALSE, col.names = FALSE, quote = FALSE)
write.table(list.files('cache/drug/drugsfda'),"FDADrugInfoFiles.txt", row.names = FALSE, col.names = FALSE, quote = FALSE)

system('./conversionJsonParquet.sh')
system('chmod +x commands.sh; ./commands.sh')

print("copying over unprocessed files")
c("README.md") |>
  map(function(filename) {
    file.copy(file.path(filename),
    file.path(data_dir,filename))})

## Rename parquet file: enforcement
system("mv data/enforcement/drug-enforcement-0001-of-0001.json.zip_rev.parquet data/enforcement/drug-enforcement.parquet")
system("mv data/ndc/drug-ndc-0001-of-0001.json.zip_rev.parquet data/ndc/drug-ndc.parquet")
system("mv data/drugs_fda/drug-drugsfda-0001-of-0001.json.zip_rev.parquet data/drugs_fda/drug-drugsfda.parquet")
