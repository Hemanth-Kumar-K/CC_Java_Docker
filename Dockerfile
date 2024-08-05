# Use the official Maven image to build the application
# This image contains Maven and OpenJDK 11
FROM maven:3.8.6-openjdk-11 AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and install dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code and compile the application
COPY src /app/src
RUN mvn package -DskipTests

# Use a smaller base image to run the application
# This image contains only the OpenJDK runtime
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/CC_Exercise-0.0.1-SNAPSHOT.jar /app/CC_Exercise-0.0.1-SNAPSHOT.jar

# Run the jar file
ENTRYPOINT ["java", "-jar", "/app/CC_Exercise-0.0.1-SNAPSHOT.jar"]
