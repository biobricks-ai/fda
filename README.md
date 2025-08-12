# fda
source: https://open.fda.gov/data/downloads/

<a href="https://github.com/biobricks-ai/fda/actions"><img src="https://github.com/biobricks-ai/fda/actions/workflows/bricktools-check.yaml/badge.svg?branch=main"/></a>

## Description
Bulk downloads of standardized FDA datasets across categories including Animal & Veterinary, Food, Human Drugs, Medical Devices, and Tobacco. Each dataset is provided as partitioned, zipped JSON files matching the openFDA API schema, ideal for offline analysis or working around API limits. Updated periodically—requires re-downloading all partitions to stay current.

## Usage
```{R}
biobricks::install_brick("fda")
biobricks::brick_pull("fda")
biobricks::brick_load("fda")
```
