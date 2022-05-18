#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Apr 22 15:48:23 2022

@author: trayneli
"""

import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq
import pyarrow.dataset as ds
import argparse
import glob


parser = argparse.ArgumentParser(description='Combines a set of parquet files into a single file')
parser.add_argument('-fileInputDir','--inputdir', help='Directory starting from fda/ where parquet data to join is located', required=True)
parser.add_argument('-fileOutput','--output', help='Output path for combined parquet file', required=True)
args = vars(parser.parse_args())


def combineDrugParquetFiles(inputDir, outputFile):
    AllTableNames=[]
    inputFileList=glob.glob(str(str(inputDir)+'*parquet'))
    for i in inputFileList:
        i_temp=pq.read_table(i).to_pandas()
        AllTableNames.append(i_temp)
    frame = pd.concat(AllTableNames, axis=0, ignore_index=True)
    table = pa.Table.from_pandas(frame)
    pq.write_table(table, str(outputFile))
   
if __name__ == "__main__":
    combineDrugParquetFiles(args['inputdir'],args['output'])

