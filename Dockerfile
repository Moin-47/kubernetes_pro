FROM maven as build
WORKDIR /app
RUN git clone https://github.com/Moin-47/spring_pro.git .
RUN mvn clean package
FROM openjdk:17-alpine
COPY --from=build /app/target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
