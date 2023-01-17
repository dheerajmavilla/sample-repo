#!/bin/bash
export OUT_FILE=terraform/unittest_output.txt

start=$(grep -n "FAIL " $OUT_FILE |cut -f1 -d:|head -n 1)
end=$(grep -n "FAIL" $OUT_FILE |cut -f1 -d:|tail -n 1)

sed -n $start,"$end"p $OUT_FILE
test
second
