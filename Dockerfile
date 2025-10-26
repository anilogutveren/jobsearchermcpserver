# Build stage
FROM gradle:8.5.0-jdk21 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon

# Runtime stage
FROM openjdk:21-jdk-slim
VOLUME /tmp
COPY --from=build /home/gradle/src/build/libs/*.jar app.jar
EXPOSE 8080
# MCP discovery labels
ENV MCP_TRANSPORT=http
ENV FASTMCP_HOST=0.0.0.0
ENV FASTMCP_PORT=8080
ENV FASTMCP_NAME=jobsearchermcpserver
ENTRYPOINT ["java","-jar","/app.jar"]