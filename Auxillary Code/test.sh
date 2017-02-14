#!/bin/bash

#test='Tariq\Cannonier'
test='YALE/NDAR_INVJ2CBCRYX/baseline_year_1_arm_1/mid-exported_NDAR_INVJ2CBCRYX_baseline_year_1_arm_1_SessionC'

test1=${test#*'/'}
test2=${test1#*'/'}
test3=${test2#*'/'}

echo $test
