### Data Overview
The human drug data from the FDA is downloaded as json files and converted to parquet data files. Multiple json files are combined to form a single parquet file per data drug set. 
### Data Tables Included

 - ``drug-enforcement.parquet`` 
 -  ``drug-ndc.parquet``
 - ``drug-event.parquet``  
 - ``drug-label.parquet`` (Note: 2 GB file)
 - ``pharmacogenomic-biomarkers.parquet``
 - ``NucleicAcidTestsHumanGenetics.parquet``
 - ``NucleicAcidTestsMicrobial.parquet``
 - ``ApprovedCompanionDiagnosticDevices.parquet``
 

*Note: Different datasets can include unique identifiers*

 Columns can be harmonized across the different datasets extracted. The following columns can be harmonized in the drug data-sets. 
 - is_original_packager: Has the drug been repackaged for distribution
 - upc: universal product code
 - original_packager_product_ndc: ndc identifies the original packager
 - manufacturer name: name of manufacturer/ drug company that makes the product. 
 - unii: Unique Ingredient Identifier, which is a non-proprietary, free, unique, unambiguous, non-semantic, alphanumeric identifier based on a substance’s molecular structure and/or descriptive information.
 - product_type: type of product described
 - spl_set_id: Unique identifier for the Structured Product Label for a product, which is stable across versions of the label. Also referred to as the set ID.
 - route: The route of administation of the drug product.
 - generic_name: Generic name(s) of the drug product.
 - brand_name: Brand or trade name of the drug product.
 - product_ndc: The labeler manufacturer code and product code segments of the NDC number, separated by a hyphen.
 - substance_name: The list of active ingredients of a drug product.
 - spl_id: Unique identifier for a particular version of a Structured Product Label for a product. Also referred to as the document ID.
 - package_ndc: This number, known as the NDC, identifies the labeler, product, and trade package size. The first segment, the labeler code, is assigned by the FDA. A labeler is any firm that manufactures (including repackers or relabelers), or distributes (under its own name) the drug.
 - application_number: This corresponds to the NDA, ANDA, or BLA number reported by the labeler for products which have the corresponding Marketing Category designated. If the designated Marketing Category is OTC Monograph Final or OTC Monograph Not Final, then the application number will be the CFR citation corresponding to the appropriate Monograph (e.g. “part 341”). For unapproved drugs, this field will be null.
 - rxcuii: The RxNorm Concept Unique Identifier. RxCUI is a unique number that describes a semantic concept about the drug product, including its ingredients, strength, and dose forms.
 - pharm_class_moa: Mechanism of action of the drug—molecular, subcellular, or cellular functional activity—of the drug’s established pharmacologic class. Takes the form of the mechanism of action
 - pharm_class_epc: Established pharmacologic class associated with an approved indication of an active moiety (generic drug) that the FDA has determined to be scientifically valid and clinically meaningful. Takes the form of the pharmacologic class
 - pharm_class_cs: Chemical structure classification of the drug product’s pharmacologic class. Takes the form of the classification, followed by `[Chemical/Ingredient]`
 - nui: Unique identifier applied to a drug concept within the National Drug File Reference Terminology (NDF-RT).
 - pharm_class_pe: Physiologic effect or pharmacodynamic effect—tissue, organ, or organ system level functional activity—of the drug’s established pharmacologic class. Takes the form of the effect

#### Drug Labeling data ``data/drug_label``
Information is submitted in structured product labeling format for FDA drug labeling data. Includes data for prescription and OTC drugs. 
Include the following sections, with each section containing specific fields:
 - Indications for use
 - Indications for purpose
 - Adverse reactions
 *For detailed descriptions of each field*, see ``data/drug_label/drug_label_reference.pdf``
```
dvc get git@github.com:insilica/oncindex-bricks.git bricks/fda/data/drug_label/drug_label_reference.pdf -o data/drug_label/drug_label_reference.pdf
```
#### National Drug Code Directory data ``data/ndc``
 - Returns data from the NDC data directory
 - The new edition of the NDC Directory includes electronically listed human prescription and OTC drugs that have been manufactured, prepared, propagated, compounded, or processed by registered establishments for commercial distribution.
 *For detailed descriptions of each field*, see ``data/ndc/NDC_field_info.pdf``
 ```
dvc get git@github.com:insilica/oncindex-bricks.git bricks/fda/data/ndc/NDC_field_info.pdf -o data/ndc/NDC_field_info.pdf
```
#### Drug Recall Enforcement data ``data/enforcement``
 - Contains information on recall events submitted to the FDA. 
 - *For detailed descriptions of each field*, see ``data/enfocement/enforcement_fields.pdf``
 ```
dvc get git@github.com:insilica/oncindex-bricks.git bricks/fda/data/enfocement/enforcement_fields.pdf -o data/enfocement/enforcement_fields.pdf
```

#### Drug Adverse events ``data/drug_event``
Collects information on adverse events and medication error reports submitted to the FDA
*Patient Information:* Patient ID, Age, weight.
*General Information:* Report ID, Date received
*Products:* Product Name, ID
*Patient Reactions:* Adverse patient events/reactions
 - *For detailed descriptions of each field*, see ``data/drug_event/drug_events.pdf``
 ```
dvc get git@github.com:insilica/oncindex-bricks.git bricks/fda/data/drug_event/fields_adverse_events.pdf -o data/drug_event/fields_adverse_events.pdf
```

#### Drugs FDA ``data/drugs_fda``

 - Contains information describing prescription brand-name drug products, generic drug products, and many therapeutic biological products that have been approved by the FDA. 
 - *For detailed descriptions of each field*, see ``data/drugs_fda/fda_drug_reference.pdf``

```
dvc get git@github.com:insilica/oncindex-bricks.git bricks/fda/data/drugs_fda/fda_drug_reference.pdf -o data/drugs_fda/fda_drug_reference.pdf
```

#### Pharmacogenomic Biomarkers in Drug Labeling ``data/pharmacogenomic-biomarkers.parquet``
Biomarkers in the table include germline or somatic gene variants (polymorphisms, mutations), functional deficiencies with a genetic etiology, gene expression differences, and chromosomal abnormalities as well as selected protein biomarkers that can be used for patient treatment

*Drug*: FDA Drug
*Therapeutic Area*: Can include disease or medical area of interest for the biomarker/drug. 
*Biomarker* : Biomarkers are based on standard nomenclature (HUGO). Inclusion criteria for Pharmacogenomic Biomarkers: germline or somatic gene variants (polymorphisms, mutations), functional deficiencies with a genetic etiology, gene expression differences, chromosomal abnormalities; selected proteins that are used for treatment selection are also included;
*Labeling Sections*: Describes indications, descriptions and warnings for the drug. 

#### Nucleic Acid Tests ``data/NucleicAcidTestsHumanGenetics.parquet``,``data/NucleicAcidTestsMicrobial.parquet``
https://www.fda.gov/medical-devices/in-vitro-diagnostics/nucleic-acid-based-tests

 - The following tables include FDA approved Nucleic Acid Based tests. 
 - The columns for the Nucleic Acid Test tables include the disease/use or microorganism for the test, the trade name for the test, manufacturer and submission information
 - Includes nucleic acid based tests. These tests analyze variations in the sequence, structure, or expression of deoxyribonucleic acid (DNA) and ribonucleic acid (RNA). The tests can be used to diagnose disease or medical conditions, infection with an identifiable pathogen, or determine genetic carrier status.
 - The tables include both a list of Human Genetic Nucleic Acid Tests and Microbial Nucleic Acid Tests. 


#### Approved Diagnostic Tests ``ApprovedCompanionDiagnosticDevices.parquet``
https://www.fda.gov/medical-devices/in-vitro-diagnostics/list-cleared-or-approved-companion-diagnostic-devices-in-vitro-and-imaging-tools

 - A *companion diagnostic device* is an in vitro diagnostic device or an imaging tool that provides information essential for the safe  and effective use of a corresponding therapeutic product. The most recently approved devices are listed at the top of the tables. 
 - The columns for this table include the diagnostic name for the test, pre-market approval info/ID, Diagnostic test manufacturer, indications and Device Indication for a Specific Group of Oncology Therapeutic Products and Trade Name (Generic) – NDA/BLA. 