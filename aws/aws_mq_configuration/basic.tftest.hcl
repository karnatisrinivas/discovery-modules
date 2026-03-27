#tftest.hcl
variables {
  env                     = "dev"
  region                  = "us-east-1"
  name                    = "test-mq-broker-config"
  engine_type             = "ActiveMQ"
  engine_version          = "5.17.6"
  authentication_strategy = "simple"
  description             = null
  data                    = <<DATA
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<broker xmlns="http://activemq.apache.org/schema/core">
  <plugins>
    <forcePersistencyModeBrokerPlugin persistenceFlag="true"/>
    <statisticsBrokerPlugin/>
    <timeStampingBrokerPlugin ttlCeiling="86400000" zeroExpirationOverride="86400000"/>
  </plugins>
</broker>
DATA
}

run "validate" {

  command = plan
  assert {
    condition     = aws_mq_configuration.this.name == "test-mq-broker-config"
    error_message = "MQ broker config name is not correct"
  }
}