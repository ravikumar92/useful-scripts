#!/bin/bash

tf_main_path=/Users/ravikumar/Documents/trip-factory/tf-main
tf_core_path=/Users/ravikumar/Documents/trip-factory/tf-core
tomcat_path=/opt/homebrew/Cellar/tomcat@7/7.0.109_1/libexec

is_core_included=0
is_main_included=0
is_both_included=0

echo "Argument received: $1"
if [[ $1 == "main" ]]; then
	is_main_included=1

elif [[ $1 == "core" ]]; then
	is_core_included=1
else
	is_both_included=1
fi
	

cd $tomcat_path
./bin/catalina.sh stop
sleep 1

if [[ $is_core_included  -eq 1 ]] || [[ $is_both_included  -eq 1 ]]; then
	cd $tf_core_path
	ant
	sleep 1
fi

if [[ $is_main_included  -eq 1 ]] || [[ $is_both_included  -eq 1 ]]; then
	cd $tf_main_path
	ant
	sleep 1
fi

cd $tomcat_path
sleep 1
./bin/catalina.sh jpda start
