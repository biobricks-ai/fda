#!/usr/bin/env bash

## set up uv venv; must have uv installed
mkdir -p docs/reference

curl -L -o docs/reference/drugndc_reference.pdf https://open.fda.gov/fields/drugndc_reference.pdf
curl -L -o docs/reference/druglabel_reference.pdf https://open.fda.gov/fields/druglabel_reference.pdf
curl -L -o docs/reference/drugsfda_reference.pdf https://open.fda.gov/fields/drugsfda_reference.pdf
curl -L -o docs/reference/drugevent_reference.pdf https://open.fda.gov/fields/drugevent_reference.pdf
curl -L -o docs/reference/drugenforcement_reference.pdf https://open.fda.gov/fields/drugenforcement_reference.pdf