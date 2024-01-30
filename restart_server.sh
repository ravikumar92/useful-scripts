#!/bin/bash

# Get the process ID of Tomcat using ps and grep
pid=$(ps -ef | grep "[t]omcat" | awk '{print $2}')

if [ -n "$pid" ]; then
    echo "Tomcat process ID is: $pid"
else
    echo "Tomcat is not running."
fi


#kill the process
kill -9 $pid

#restart the server
cd /opt/homebrew/Cellar/tomcat@7/7.0.109_1/libexec > /dev/null
./bin/catalina.sh jpda start
cd - > /dev/null
