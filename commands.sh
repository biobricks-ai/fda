conda create --force --no-default-packages -n fda_env -y;
conda activate fda_env;
pip3 install -r requirements.txt;
unzip -p cache/drug/label/drug-label-0001-of-0010.json.zip | jq .results > cache/drug/label/drug-label-0001-of-0010.json.zip_rev.json;
  rm cache/drug/label/drug-label-0001-of-0010.json.zip;
  python3 python/jsonTOParquet.py --input cache/drug/label/drug-label-0001-of-0010.json.zip_rev.json --output cache/tmp/drug_label/drug-label-0001-of-0010.json.zip_rev.parquet;
  rm cache/drug/label/drug-label-0001-of-0010.json.zip_rev.json;
  sleep 3
unzip -p cache/drug/label/drug-label-0002-of-0010.json.zip | jq .results > cache/drug/label/drug-label-0002-of-0010.json.zip_rev.json;
  rm cache/drug/label/drug-label-0002-of-0010.json.zip;
  python3 python/jsonTOParquet.py --input cache/drug/label/drug-label-0002-of-0010.json.zip_rev.json --output cache/tmp/drug_label/drug-label-0002-of-0010.json.zip_rev.parquet;
  rm cache/drug/label/drug-label-0002-of-0010.json.zip_rev.json;
  sleep 3
unzip -p cache/drug/label/drug-label-0002-of-0010.json.zip_rev.json | jq .results > cache/drug/label/drug-label-0002-of-0010.json.zip_rev.json_rev.json;
  rm cache/drug/label/drug-label-0002-of-0010.json.zip_rev.json;
  python3 python/jsonTOParquet.py --input cache/drug/label/drug-label-0002-of-0010.json.zip_rev.json_rev.json --output cache/tmp/drug_label/drug-label-0002-of-0010.json.zip_rev.json_rev.parquet;
  rm cache/drug/label/drug-label-0002-of-0010.json.zip_rev.json_rev.json;
  sleep 3
unzip -p cache/drug/label/drug-label-0003-of-0010.json.zip | jq .results > cache/drug/label/drug-label-0003-of-0010.json.zip_rev.json;
  rm cache/drug/label/drug-label-0003-of-0010.json.zip;
  python3 python/jsonTOParquet.py --input cache/drug/label/drug-label-0003-of-0010.json.zip_rev.json --output cache/tmp/drug_label/drug-label-0003-of-0010.json.zip_rev.parquet;
  rm cache/drug/label/drug-label-0003-of-0010.json.zip_rev.json;
  sleep 3
unzip -p cache/drug/label/drug-label-0004-of-0010.json.zip | jq .results > cache/drug/label/drug-label-0004-of-0010.json.zip_rev.json;
  rm cache/drug/label/drug-label-0004-of-0010.json.zip;
  python3 python/jsonTOParquet.py --input cache/drug/label/drug-label-0004-of-0010.json.zip_rev.json --output cache/tmp/drug_label/drug-label-0004-of-0010.json.zip_rev.parquet;
  rm cache/drug/label/drug-label-0004-of-0010.json.zip_rev.json;
  sleep 3
unzip -p cache/drug/label/drug-label-0005-of-0010.json.zip | jq .results > cache/drug/label/drug-label-0005-of-0010.json.zip_rev.json;
  rm cache/drug/label/drug-label-0005-of-0010.json.zip;
  python3 python/jsonTOParquet.py --input cache/drug/label/drug-label-0005-of-0010.json.zip_rev.json --output cache/tmp/drug_label/drug-label-0005-of-0010.json.zip_rev.parquet;
  rm cache/drug/label/drug-label-0005-of-0010.json.zip_rev.json;
  sleep 3
unzip -p cache/drug/label/drug-label-0006-of-0010.json.zip | jq .results > cache/drug/label/drug-label-0006-of-0010.json.zip_rev.json;
  rm cache/drug/label/drug-label-0006-of-0010.json.zip;
  python3 python/jsonTOParquet.py --input cache/drug/label/drug-label-0006-of-0010.json.zip_rev.json --output cache/tmp/drug_label/drug-label-0006-of-0010.json.zip_rev.parquet;
  rm cache/drug/label/drug-label-0006-of-0010.json.zip_rev.json;
  sleep 3
unzip -p cache/drug/label/drug-label-0007-of-0010.json.zip | jq .results > cache/drug/label/drug-label-0007-of-0010.json.zip_rev.json;
  rm cache/drug/label/drug-label-0007-of-0010.json.zip;
  python3 python/jsonTOParquet.py --input cache/drug/label/drug-label-0007-of-0010.json.zip_rev.json --output cache/tmp/drug_label/drug-label-0007-of-0010.json.zip_rev.parquet;
  rm cache/drug/label/drug-label-0007-of-0010.json.zip_rev.json;
  sleep 3
unzip -p cache/drug/label/drug-label-0008-of-0010.json.zip | jq .results > cache/drug/label/drug-label-0008-of-0010.json.zip_rev.json;
  rm cache/drug/label/drug-label-0008-of-0010.json.zip;
  python3 python/jsonTOParquet.py --input cache/drug/label/drug-label-0008-of-0010.json.zip_rev.json --output cache/tmp/drug_label/drug-label-0008-of-0010.json.zip_rev.parquet;
  rm cache/drug/label/drug-label-0008-of-0010.json.zip_rev.json;
  sleep 3
unzip -p cache/drug/label/drug-label-0009-of-0010.json.zip | jq .results > cache/drug/label/drug-label-0009-of-0010.json.zip_rev.json;
  rm cache/drug/label/drug-label-0009-of-0010.json.zip;
  python3 python/jsonTOParquet.py --input cache/drug/label/drug-label-0009-of-0010.json.zip_rev.json --output cache/tmp/drug_label/drug-label-0009-of-0010.json.zip_rev.parquet;
  rm cache/drug/label/drug-label-0009-of-0010.json.zip_rev.json;
  sleep 3
unzip -p cache/drug/label/drug-label-0010-of-0010.json.zip | jq .results > cache/drug/label/drug-label-0010-of-0010.json.zip_rev.json;
  rm cache/drug/label/drug-label-0010-of-0010.json.zip;
  python3 python/jsonTOParquet.py --input cache/drug/label/drug-label-0010-of-0010.json.zip_rev.json --output cache/tmp/drug_label/drug-label-0010-of-0010.json.zip_rev.parquet;
  rm cache/drug/label/drug-label-0010-of-0010.json.zip_rev.json;
  sleep 3
python3 python/combineParquetFiles.py --inputdir cache/tmp/drug_label/  --output data/drug_label/drug-label.parquet;
unzip -p cache/drug/enforcement/drug-enforcement-0001-of-0001.json.zip | jq .results > cache/drug/enforcement/drug-enforcement-0001-of-0001.json.zip_rev.json;
  rm cache/drug/enforcement/drug-enforcement-0001-of-0001.json.zip;
  python3 python/jsonTOParquet.py --input cache/drug/enforcement/drug-enforcement-0001-of-0001.json.zip_rev.json --output data/enforcement/drug-enforcement-0001-of-0001.json.zip_rev.parquet;
  rm cache/drug/enforcement/drug-enforcement-0001-of-0001.json.zip_rev.json;
  
unzip -p cache/drug/ndc/drug-ndc-0001-of-0001.json.zip | jq .results > cache/drug/ndc/drug-ndc-0001-of-0001.json.zip_rev.json;
  rm cache/drug/ndc/drug-ndc-0001-of-0001.json.zip;
  python3 python/jsonTOParquet.py --input cache/drug/ndc/drug-ndc-0001-of-0001.json.zip_rev.json --output data/ndc/drug-ndc-0001-of-0001.json.zip_rev.parquet;
  rm cache/drug/ndc/drug-ndc-0001-of-0001.json.zip_rev.json;
  
unzip -p cache/drug/event/all_other/drug-event-0001-of-0004.json.zip | jq .results > cache/drug/event/all_other/drug-event-0001-of-0004.json.zip_rev.json;
  rm cache/drug/event/all_other/drug-event-0001-of-0004.json.zip;
  python3 python/jsonTOParquet.py --input cache/drug/event/all_other/drug-event-0001-of-0004.json.zip_rev.json --output cache/tmp/drug_event/drug-event-0001-of-0004.json.zip_rev.parquet;
  rm cache/drug/event/all_other/drug-event-0001-of-0004.json.zip_rev.json;
unzip -p cache/drug/event/all_other/drug-event-0002-of-0004.json.zip | jq .results > cache/drug/event/all_other/drug-event-0002-of-0004.json.zip_rev.json;
  rm cache/drug/event/all_other/drug-event-0002-of-0004.json.zip;
  python3 python/jsonTOParquet.py --input cache/drug/event/all_other/drug-event-0002-of-0004.json.zip_rev.json --output cache/tmp/drug_event/drug-event-0002-of-0004.json.zip_rev.parquet;
  rm cache/drug/event/all_other/drug-event-0002-of-0004.json.zip_rev.json;
unzip -p cache/drug/event/all_other/drug-event-0003-of-0004.json.zip | jq .results > cache/drug/event/all_other/drug-event-0003-of-0004.json.zip_rev.json;
  rm cache/drug/event/all_other/drug-event-0003-of-0004.json.zip;
  python3 python/jsonTOParquet.py --input cache/drug/event/all_other/drug-event-0003-of-0004.json.zip_rev.json --output cache/tmp/drug_event/drug-event-0003-of-0004.json.zip_rev.parquet;
  rm cache/drug/event/all_other/drug-event-0003-of-0004.json.zip_rev.json;
unzip -p cache/drug/event/all_other/drug-event-0004-of-0004.json.zip | jq .results > cache/drug/event/all_other/drug-event-0004-of-0004.json.zip_rev.json;
  rm cache/drug/event/all_other/drug-event-0004-of-0004.json.zip;
  python3 python/jsonTOParquet.py --input cache/drug/event/all_other/drug-event-0004-of-0004.json.zip_rev.json --output cache/tmp/drug_event/drug-event-0004-of-0004.json.zip_rev.parquet;
  rm cache/drug/event/all_other/drug-event-0004-of-0004.json.zip_rev.json;
python3 python/combineParquetFiles.py --inputdir cache/tmp/drug_event/  --output data/drug_event/drug-event.parquet;
unzip -p cache/drug/drugsfda/drug-drugsfda-0001-of-0001.json.zip | jq .results > cache/drug/drugsfda/drug-drugsfda-0001-of-0001.json.zip_rev.json;
  rm cache/drug/drugsfda/drug-drugsfda-0001-of-0001.json.zip;
  python3 python/jsonTOParquet.py --input cache/drug/drugsfda/drug-drugsfda-0001-of-0001.json.zip_rev.json --output data/drugs_fda/drug-drugsfda-0001-of-0001.json.zip_rev.parquet;
  rm cache/drug/drugsfda/drug-drugsfda-0001-of-0001.json.zip_rev.json;
  
rm -r cache/tmp;
rm *Files.txt;
conda deactivate; conda env remove -n fda_env
