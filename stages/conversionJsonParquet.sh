#!/usr/bin/env bash

## set up uv venv; must have uv installed
echo "#!/usr/bin/env bash

source .venv/bin/activate;" > stages/commands.sh

echo "mkdir -p brick;
mkdir -p cache/tmp/drug_label;
mkdir -p cache/tmp/drug_event;" >> stages/commands.sh

## Drug label data:
for i in $(cat list/DrugLabelFiles.txt); do
  echo "unzip -p cache/drug/label/$i | jq .results > cache/drug/label/${i}_rev.json;
  python3 stages/jsonToParquet.py --input cache/drug/label/${i}_rev.json --output cache/tmp/drug_label/${i}_rev.parquet;
  sleep 3"
done >> stages/commands.sh
echo "python3 stages/combineParquetFiles.py --inputdir cache/tmp/drug_label/  --output brick/drug-label.parquet;" >> stages/commands.sh

## Enforcement Drug data:
for i in $(cat list/EnfLabelFiles.txt); do
  echo "unzip -p cache/drug/enforcement/$i | jq .results > cache/drug/enforcement/${i}_rev.json;
  python3 stages/jsonToParquet.py --input cache/drug/enforcement/${i}_rev.json --output brick/${i}_rev.parquet;
  "
done >> stages/commands.sh

## NDC data info
for i in $(cat list/NDCLabelFiles.txt); do
  echo "unzip -p cache/drug/ndc/$i | jq .results > cache/drug/ndc/${i}_rev.json;
  python3 stages/jsonToParquet.py --input cache/drug/ndc/${i}_rev.json --output brick/${i}_rev.parquet;
  "
done >> stages/commands.sh

## Drug Event sample data:
for i in $(cat list/drugEventFiles.txt); do
  echo "unzip -p cache/drug/event/all_other/$i | jq .results > cache/drug/event/all_other/${i}_rev.json;
  python3 stages/jsonToParquet.py --input cache/drug/event/all_other/${i}_rev.json --output cache/tmp/drug_event/${i}_rev.parquet;
  "
done >> stages/commands.sh
echo "python3 stages/combineParquetFiles.py --inputdir cache/tmp/drug_event/  --output brick/drug-event.parquet;" >> stages/commands.sh

## Drugs FDA sample data:
for i in $(cat list/FDADrugInfoFiles.txt); do
  echo "unzip -p cache/drug/drugsfda/$i | jq .results > cache/drug/drugsfda/${i}_rev.json;
  python3 stages/jsonToParquet.py --input cache/drug/drugsfda/${i}_rev.json --output brick/${i}_rev.parquet;
  "
done >> stages/commands.sh
echo "cp README.md brick/README.md;" >> stages/commands.sh
echo "cp data/* brick;" >> stages/commands.sh
echo "mv brick/drug-enforcement-0001-of-0001.json.zip_rev.parquet brick/drug-enforcement.parquet;" >> stages/commands.sh
echo "mv brick/drug-ndc-0001-of-0001.json.zip_rev.parquet brick/drug-ndc.parquet;" >> stages/commands.sh
echo "mv brick/drug-drugsfda-0001-of-0001.json.zip_rev.parquet brick/drug-drugsfda.parquet;" >> stages/commands.sh

chmod +x stages/commands.sh;