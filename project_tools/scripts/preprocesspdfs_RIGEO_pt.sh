#!/bin/bash
# Copyright (C) 2021 ServiceNow, Inc.
#
# PDF->CSV
# 
UNPROCESSED=(
)

NOW=$(date +"%m_%d_%Y_%H_%M_%S")

#make push

#STEP=200
STEP=1
for start in $(seq 0 ${STEP} 4)
do
    echo $start
    end=$(($start+${STEP}))
    echo $end

    #be *very* careful to put a / at the end of the filepath
    CMD="python scripts/pdf_to_txt.py --NFILE_RANGE $start $end --N_FILES -1 --WRITE_OUTPUT --LOCAL_DIR /i/Brazil/RIGEO/ --OUTPUT_DIR /i/Brazil/RIGEO_pdfout/"
    #echo "Error: Internal job management tool was to execute the command. Please run the command locally."
    echo ${CMD}
    #python scripts/pdf_to_txt.py --N_FILES $start $end --WRITE_OUTPUT --LOCAL_DIR /home/ubuntu/sarig/data/01_raw/20220716/geoscan/raw/pdf/ --OUTPUT_DIR /home/ubuntu/sarig/data/02_intermediate/20220716/geoscan/pdf/v1_20220716/
    $CMD &
done
