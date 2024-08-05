# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jre-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY target/CC_Exercise-0.0.1-SNAPSHOT.jar /app

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "CC_Exercise-0.0.1-SNAPSHOT.jar"]
