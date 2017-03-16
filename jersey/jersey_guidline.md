## jersey [guideline](https://jersey.java.net/documentation/latest/user-guide.html#getting-started)
> Creating a JavaEE Web Application
```bash
mvn archetype:generate -DarchetypeArtifactId=jersey-quickstart-webapp \
                -DarchetypeGroupId=org.glassfish.jersey.archetypes -DinteractiveMode=false \
                -DgroupId=com.example -DartifactId=simple-service-webapp -Dpackage=com.example \
                -DarchetypeVersion=2.25.1
```
> To compile and package the application into a WAR, invoke the following maven command in your console:
> 
```bash
mvn clean package
```
> Now you are ready to take the packaged WAR (located under ./target/simple-service-webapp.war) and deploy it to a Servlet container of your choice.