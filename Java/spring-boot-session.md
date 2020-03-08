<h3>Manage User Session With Spring JDBC Session </h3>
ref: [dzone.com](https://dzone.com/articles/spring-jdbc-session) 

<h4>Introduction</h4>
<p>In a web application, user session management is crucial for managing user state. Spring Session is an implementation of four approaches, storing session data in a persistent data store. Spring Session supports multiple datastores, like RDBMS, Redis, HazelCast, MongoDB, etc., to save the user session data.</p>

<h4>Spring Session Benefits</h4>

    * Spring Session decouples the session management logic from the application, making it more tolerant.
    * Spring Session keeps information in the database, so it’s great to use in a clustered environment with multiple server nodes. Because of this, we don’t need to rely on the sticky session or session replication logic.
    * As session data is stored in the database, user session data is not lost if the application crashes. When the application started again, it picks up the user session from the database.
    * It is easy to switch between session storage. Just by changing the configuration, we can switch from using JDBC to Redis.

<h4>Adding Dependencies</h4>

`
 <dependency>
    <groupId>org.springframework.session</groupId>
    <artifactId>spring-session-core</artifactId>
 </dependency>
 <dependency>
    <groupId>org.springframework.session</groupId>
    <artifactId>spring-session-jdbc</artifactId>
 </dependency>
`

<h4>Configure Spring JDBC Session Properties</h4>

The  `application.properties` file specifies the H2 database configuration and Spring Session attributes.

># Session store type.

>spring.session.store-type=jdbc

># Database schema initialization mode.

>spring.session.jdbc.initialize-schema=embedded

># Path to the SQL file to use to initialize the database schema.

>spring.session.jdbc.schema=`classpath:/session-db-script.sql` 

># Name of the database table used to store sessions.

>spring.session.jdbc.table-name=SPRING_SESSION

>spring.session.timeout=`30m`


We added the property  `spring.session.store-type=jdbc`. Here, we specify using JDBC to store the session data.
As we are using the H2 in-memory database, Spring Session creates the following tables required to store the session data automatically from the script:

>CREATE SCHEMA IF NOT EXISTS TESTDB;`Not required if schema is already created`

>SET SCHEMA TESTDB;`Not required if schema is already created`

>CREATE TABLE `TESTDB`.SPRING_SESSION (

>PRIMARY_ID CHAR(36) NOT NULL,

>SESSION_ID CHAR(36) NOT NULL,

>CREATION_TIME BIGINT NOT NULL,

>LAST_ACCESS_TIME BIGINT NOT NULL,

>MAX_INACTIVE_INTERVAL INT NOT NULL,

>EXPIRY_TIME BIGINT NOT NULL,

>PRINCIPAL_NAME VARCHAR(100),

>CONSTRAINT SPRING_SESSION_PK PRIMARY KEY (PRIMARY_ID)

>);

>CREATE UNIQUE INDEX SPRING_SESSION_IX1 ON `TESTDB`.SPRING_SESSION (SESSION_ID);

>CREATE INDEX SPRING_SESSION_IX2 ON `TESTDB`.SPRING_SESSION (EXPIRY_TIME);

>CREATE INDEX SPRING_SESSION_IX3 ON `TESTDB`.SPRING_SESSION (PRINCIPAL_NAME);

>CREATE TABLE `TESTDB`.SPRING_SESSION_ATTRIBUTES (

>SESSION_PRIMARY_ID CHAR(36) NOT NULL,

>ATTRIBUTE_NAME VARCHAR(200) NOT NULL,

>ATTRIBUTE_BYTES BLOB NOT NULL,

>CONSTRAINT SPRING_SESSION_ATTRIBUTES_PK PRIMARY KEY (SESSION_PRIMARY_ID, ATTRIBUTE_NAME),

>CONSTRAINT SPRING_SESSION_ATTRIBUTES_FK FOREIGN KEY (SESSION_PRIMARY_ID) REFERENCES `TESTDB`.SPRING_SESSION(PRIMARY_ID) ON DELETE >CASCADE

>);

If we specify `spring.session.jdbc.initialize-schema=never`, then we need to create session tables in manually executing the script. In production, we don't enable the auto-create/update.