FROM maven:3-eclipse-temurin-17 as build

WORKDIR /app

COPY /tic-tac-toe-kata/pom.xml /app/pom.xml

RUN ["mvn", "verify", "clean", "--fail-never"]

COPY /tic-tac-toe-kata/src /app/src

RUN ["mvn", "package"]

CMD /bin/sh -c
