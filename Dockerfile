# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Build the project using Maven
RUN ./mvnw clean package

# Run the application
CMD ["java", "-jar", "target/CC_Exercise-0.0.1-SNAPSHOT.jar"]
