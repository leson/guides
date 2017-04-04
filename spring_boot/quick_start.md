# boot
spring boot POC 

## init spring boot empty project with maven
- create pom.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.test</groupId>
    <artifactId>BootDemo</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>1.5.2.RELEASE</version>
    </parent>
    <!-- Additional lines to be added here... -->
</project>
```

- append web project dependency to pom.xml
```xml
<dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
    </dependencies>
```

- list project dependency jars
```bash
mvn dependency:tree   
```

## write programs with eclipse

- convert project as a eclipse project
```bash
mvn eclipse:eclipse
```

- import project via eclipse (...)

- convert project to maven project
    - [right click] projectName
    - configure
    - convert to maven project
- setup project properties 
    - select project then press `alt`+`enter` to open project's properties
    - setup "Project Facets"

- eclipse will auto create "src/main/java" "src/test/java" "src/main/resourse"

- write program ...
```java
@RestController
@EnableAutoConfiguration
public class MainCtrl {

    @RequestMapping("/")
    String test() {

        return "hello spring boot world";
    }

    public static void main(String[] args) {
        SpringApplication.run(MainCtrl.class, args);
    }

}
```

## startup project 
```bash
mvn spring-boot:run
```
test access link on local:[http://localhost:8080/](http://localhost:8080/)

## build package ("executable jars" name  "fat jars")
- need dependence plugin :"spring-boot-maven-plugin"
```xml
<build>
    <plugins>
        <plugin>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-maven-plugin</artifactId>
        </plugin>
    </plugins>
</build>
```

- build package
```bash
mvn clean package
```
-  execute jar package
```bash
java -jar target/xxx.jar
```

### reference links
[cnblogs springboot step by step ](http://www.cnblogs.com/larryzeal/p/5799195.html#c4)
[quick start spring boot](http://blog.csdn.net/xiaoyu411502/article/details/47864969)