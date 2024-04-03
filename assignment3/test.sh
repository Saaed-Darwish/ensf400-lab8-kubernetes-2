#!/bin/bash

# This test.sh file is to run and check the percentages of app1 or app2 responses
# to make sure they coincide with the specifications

# Initialize counters for app1 and app2 responses
app1_count=0
app2_count=0

# Total number of requests to make (increase for more accuracy)
total_requests=100

for i in $(seq 1 $total_requests)
do
    # Replace with your actual command to curl the application
    response=$(curl -s http://$(minikube ip -p ensf400)/)
    
    # Increment counters based on response
    if [[ $response == *"app-1-dep"* ]]; then
        app1_count=$((app1_count+1))
    elif [[ $response == *"app-2-dep"* ]]; then
        app2_count=$((app2_count+1))
    fi
done

echo "App1 responses: $app1_count"
echo "App2 responses: $app2_count"

# Calculate and print percentages
echo "App1 percentage: $((app1_count * 100 / total_requests))%"
echo "App2 percentage: $((app2_count * 100 / total_requests))%"
