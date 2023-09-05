# 1. Produce message through key
bin/kafka-console-producer.sh --bootstrap-server localhost:9092 --topic my-topic --property "parse.key=true" --property "key.separator=:"

# Message producer example
<key name>:<value>
Ex - mykey:hello world
