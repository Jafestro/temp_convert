FROM maven:latest

LABEL author="Jafar Jafarov"

WORKDIR /app

COPY pom.xml /app

COPY . /app/

RUN mvn clean package

CMD ["java", "-jar", "target/temp_convert-1.0-SNAPSHOT.jar"]
