# Use an official Maven image to build the project
FROM maven:3.8.6-openjdk-17 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the entire project into the container
COPY . .

# Build the project using Maven
RUN mvn clean package

# Use an official OpenJDK runtime as a parent image for the runtime container
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /target/CC_Exercise-0.0.1-SNAPSHOT.jar /target/CC_Exercise-0.0.1-SNAPSHOT.jar
# Run the application
CMD ["java", "-jar", "/app/your-artifact-id.jar"]
