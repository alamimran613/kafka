### JAAS File / Config - This is extras from udemy course content

JAAS file / config
In this course, you see we use a JAAS file and do export KAFKA_OPTS="/tmp/kafka_client_jaas.conf" 

It is also possible to directly embed the jaas file as a config in the clients, and not do the export.

sudo nano /home/sizh/kafka-security/kafka_client_kerberos.properties 

Example:

security.protocol=SASL_SSL
sasl.kerberos.service.name=kafka
ssl.truststore.location=/home/gerd/ssl/kafka.client.truststore.jks
ssl.truststore.password=clientpass
sasl.jaas.config=com.sun.security.auth.module.Krb5LoginModule required useTicketCache=true;
=================

You can also skip doing a kinit before starting your client if your jaas file is the following:

sudo nano /home/sizh/kafka-security/kafka_client_jaas.conf

KafkaClient {
    com.sun.security.auth.module.Krb5LoginModule required
    useKeyTab=true
    storeKey=true
    keyTab="/tmp/reader.user.keytab"
    principal="reader@KAFKA.SECURE";
};

Or using the config as seen above:

security.protocol=SASL_SSL
sasl.jaas.config=com.sun.security.auth.module.Krb5LoginModule required useKeyTab=true storeKey=true keyTab="/tmp/reader.user.keytab" principal="reader@KAFKA.SECURE";

