FROM openjdk:8-slim
RUN apt-get update -y
RUN apt-get install maven -y
WORKDIR /opt
COPY ./complete .
RUN mvn -B -DskipTests clean package
RUN ls -l ./target
CMD ["java", "-jar" , "./target/gs-maven-0.1.0.jar"]