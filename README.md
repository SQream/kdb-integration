# kdb-integration
Demo project for data insertion from KDB+ to SQreamDB

Utilizing javakdb connector to connect kdb+ (https://github.com/KxSystems/javakdb/blob/master/docs/build.md)
## Prerequisites:
- Java 17
- Maven 3.6.3 or higher

## Installation:
`mvn install:install-file -Dfile=lib/javakdb-2.0.jar -DgroupId=com.kx -DartifactId=kx -Dversion=2.0 -Dpackaging=jar
mvn clean install
`

## Execution:
Fill the application properties file (src/main/resources/application.properties) with the relevant parameters and run:

`java -jar target/demo-0.0.1-SNAPSHOT.jar
`
