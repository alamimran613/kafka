# Increase replication factor
# Create a file named Topics-to-move.json and enter this line my-topic is example
{"topics":[{"topic":"my-topic"}],
"version":1
}

# Run below command

bin/kafka-reassign-partitions.sh --bootstrap-server localhost:9092  --topics-to-move-json-file Topics-to-move.json --broker-list "1,2,3" --generate

# Now json file is generated then you can change it like below and save it with the name of suggested-change.json

{"version":1,"partitions":[{"topic":"my-topic","partition":0,"replicas":[3,1,2],"log_dirs":["any","any","any"]},{"topic":"my-topic","partition":1,"replicas":[1,2,3],"log_dirs":["any","any","any"]},{"topic":"my-topic","partition":2,"replicas":[2,3,1],"log_dirs":["any","any","any"]}]}

# Then run below command

bin/kafka-reassign-partitions.sh --bootstrap-server localhost:9092 --reassignment-json-file suggested-change.json --execute

# Now your replication added with broker 3 for all partitons
# We can also move any paritions to another broker