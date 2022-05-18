library(kiln)
library(rvest)
library(dplyr)
library(arrow)
source(here::here("R/chrome.R"))
data_dir <- "data"
cache_dir <- "cache"
mkdir(data_dir)
mkdir(cache_dir)

# download the pdf
# found at: https://www.fda.gov/drugs/science-and-research-drugs/table-pharmacogenomic-biomarkers-drug-labeling
# pdf_url <- "https://www.fda.gov/media/124784/download"
# download_file(
#     dest_dir = "cache",
#     url = "https://www.fda.gov/media/124784/download",
#     filename = "pharmacogenmomic_biomarkers.pdf"
# )
# pdf_file <- "cache/pharmacogenmomic_biomarkers.pdf"

# process the pdf
# Doesn't seem to be an easy thing and the pdf table tools don't work
# R tabulizer won't install with R version 4 and the project has been archived
# Tried to use https://github.com/camelot-dev/camelot
# but this also won't parse the data

# grab the data
start_session()

## Alternative: Can click this button for download of excel file:
#  //*[@id="guidance_wrapper"]/div[1]/div[2]/div/button

navigate("https://www.fda.gov/drugs/science-and-research-drugs/table-pharmacogenomic-biomarkers-drug-labeling")
# below doesn't download
# click("#guidance_wrapper > div:nth-child(1) > div:nth-child(2) > div > button")
# process the html table
wait_exists("#guidance")
doc_outer_html() |>
    read_html() |>
    html_element("table") |>
    html_table() |>
    select("Drug", "Therapeutic Area*", "Biomarker†", "Labeling Sections") |>
    rename(
        "Biomarker" = "Biomarker†",
        "Therapeutic_Area" = "Therapeutic Area*",
        "Labeling_Sections" = "Labeling Sections"
    ) |> write_parquet("data/pharmacogenomic-biomarkers.parquet")
read_parquet("data/pharmacogenomic-biomarkers.parquet")
