#!/bin/bash

#restart the server
cd /opt/homebrew/Cellar/tomcat@7/7.0.109_1/libexec > /dev/null
./bin/catalina.sh jpda start
cd - > /dev/null
