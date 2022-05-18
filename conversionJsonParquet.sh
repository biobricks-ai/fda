#!/usr/bin/env bash

## set up python conda env ( will need pip3 and conda installed )
echo "conda create --force --no-default-packages -n fda_env -y;
conda activate fda_env;
pip3 install -r requirements.txt;" > commands.sh

mkdir -p data/drug_label;
mkdir -p data/enforcement;
mkdir -p data/ndc;
mkdir -p data/drug_event;
mkdir -p data/drugs_fda;
mkdir -p cache/tmp
mkdir -p cache/tmp/drug_label
mkdir -p cache/tmp/drug_event

## Drug label data:
for i in `cat DrugLabelFiles.txt`; do
  echo "unzip -p cache/drug/label/$i | jq .results > cache/drug/label/${i}_rev.json;
  rm cache/drug/label/$i;
  python3 python/jsonTOParquet.py --input cache/drug/label/${i}_rev.json --output cache/tmp/drug_label/${i}_rev.parquet;
  rm cache/drug/label/${i}_rev.json;
  sleep 3"
done >> commands.sh
echo "python3 python/combineParquetFiles.py --inputdir cache/tmp/drug_label/  --output data/drug_label/drug-label.parquet;" >> commands.sh

## Enforcement Drug data:
for i in `cat EnfLabelFiles.txt`; do
  echo "unzip -p cache/drug/enforcement/$i | jq .results > cache/drug/enforcement/${i}_rev.json;
  rm cache/drug/enforcement/$i;
  python3 python/jsonTOParquet.py --input cache/drug/enforcement/${i}_rev.json --output data/enforcement/${i}_rev.parquet;
  rm cache/drug/enforcement/${i}_rev.json;
  "
done >> commands.sh

## NDC data info
for i in `cat NDCLabelFiles.txt`; do
  echo "unzip -p cache/drug/ndc/$i | jq .results > cache/drug/ndc/${i}_rev.json;
  rm cache/drug/ndc/$i;
  python3 python/jsonTOParquet.py --input cache/drug/ndc/${i}_rev.json --output data/ndc/${i}_rev.parquet;
  rm cache/drug/ndc/${i}_rev.json;
  "
done >> commands.sh

## Drug Event sample data:
for i in `cat drugEventFiles.txt`; do
  echo "unzip -p cache/drug/event/all_other/$i | jq .results > cache/drug/event/all_other/${i}_rev.json;
  rm cache/drug/event/all_other/$i;
  python3 python/jsonTOParquet.py --input cache/drug/event/all_other/${i}_rev.json --output cache/tmp/drug_event/${i}_rev.parquet;
  rm cache/drug/event/all_other/${i}_rev.json;"
done >> commands.sh
echo "python3 python/combineParquetFiles.py --inputdir cache/tmp/drug_event/  --output data/drug_event/drug-event.parquet;" >> commands.sh

## Drugs FDA sample data:
for i in `cat FDADrugInfoFiles.txt`; do
  echo "unzip -p cache/drug/drugsfda/$i | jq .results > cache/drug/drugsfda/${i}_rev.json;
  rm cache/drug/drugsfda/$i;
  python3 python/jsonTOParquet.py --input cache/drug/drugsfda/${i}_rev.json --output data/drugs_fda/${i}_rev.parquet;
  rm cache/drug/drugsfda/${i}_rev.json;
  "
done >> commands.sh
echo "rm -r cache/tmp;" >> commands.sh
echo "rm *Files.txt;" >> commands.sh
echo "conda deactivate; conda env remove -n fda_env" >> commands.sh
