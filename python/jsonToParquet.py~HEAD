#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Apr 21 09:51:23 2022

@author: trayneli
"""

import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq
import pyarrow.dataset as ds
import argparse

parser = argparse.ArgumentParser(description='Converts json drug data file directly to parquet file')
parser.add_argument('-fileInput','--input', help='Input json file', required=True)
parser.add_argument('-fileOutput','--output', help='Output parquet file', required=True)
args = vars(parser.parse_args())


def readDrugLabelJson(inputJsonFile,outputParquetFile):
    dataLabel = pd.read_json(inputJsonFile)
    table = pa.Table.from_pandas(dataLabel)
    pq.write_table(table,outputParquetFile)


if __name__ == "__main__":
    readDrugLabelJson(args['input'],args['output'])

