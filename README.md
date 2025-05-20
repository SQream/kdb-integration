# kdb-integration
Demo project for data insertion from KDB+ to SQreamDB

Utilizing javakdb connector to connect kdb+ (https://github.com/KxSystems/javakdb/blob/master/docs/build.md)
## Prerequisites:
- Java 17
- Maven 3.6.3 or higher

## Installation:
`mvn install:install-file -Dfile=lib/javakdb-2.0.jar -DgroupId=com.kx -DartifactId=kx -Dversion=2.0 -Dpackaging=jar

mvn install:install-file -Dfile='lib/jdbc-1.0.jar' -DgroupId='com.kx' -DartifactId=jdbc-1.0-SNAPSHOT-jar-with-dependencies -Dversion='1.0-SNAPSHOT' -Dpackaging=jar

mvn clean install
`

## Execution:
Fill the application properties file (src/main/resources/application.properties) with the relevant parameters and run:

`java -jar target/demo-0.0.1-SNAPSHOT.jar
`

### Using KDB's JDBC
In order to work with KDB+ using JDBC, we need the following prerequisites:
- Download and build javakdb v1 (https://github.com/KxSystems/javakdb/releases/tag/1.0) using `mvn clean install`
- Download and build kdb's jdbc (https://github.com/KxSystems/jdbc) using `mvn clean install`
- use ps.k (located in project root directory) when starting kdb+. this file translates SQL syntax to Q. Example: `~/q/l64/q ~/q/ps.k -p 5001`

now, you can run the JdbcTest.java example in test directory.
