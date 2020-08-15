#!/bin/bash
#
rootPath=$1
testFile=$2
host=$3

echo "Root path: $rootPath"
echo "Test file: $testFile"
echo "Host: $host"

T_DIR=${PWD}



# Reporting dir: start fresh
R_DIR=$T_DIR/report
rm -rf ${R_DIR} > /dev/null 2>&1
mkdir -p $R_DIR

rm -f ${T_DIR}/test/test-plan.jtl ${T_DIR}/test/jmeter.log  > /dev/null 2>&1

bash run.sh $rootPath -Dlog_level.jmeter=DEBUG \
	-Jhost=$host \
	-n -t $T_DIR/test/$testFile -l $T_DIR/test/test-plan.jtl -j $T_DIR/test/jmeter.log \
	-e -o $R_DIR --jmeterproperty "jmeter.reportgenerator.exporter.html.series_filter=^(ConfirmationPage|IndexPage|PurchasePage|ReservePage|Test)(-success|-failure)?$"

echo "==== jmeter.log ===="
cat $T_DIR/test/jmeter.log

echo "==== Raw Test Report ===="
cat $T_DIR/test/test-plan.jtl

echo "==== HTML Test Report ===="
echo "See HTML test report in $R_DIR/index.html"