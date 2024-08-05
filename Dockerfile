# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jre

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file into the container at /app
COPY target/CC_Exercise-0.0.1-SNAPSHOT.jar /app/

# Make port 8080 available to the world outside this container
EXPOSE 5000

# Run the application
ENTRYPOINT ["java", "-jar", "CC_Exercise-0.0.1-SNAPSHOT.jar"]
