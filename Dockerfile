FROM openjdk:8-slim
WORKDIR /opt
COPY ./complete .
RUN mvn -B -DskipTests clean package
RUN ls -l ./target
