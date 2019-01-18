FROM maven:3-jdk-8-alpine as build
MAINTAINER Go About <tech@goabout.com>

ENV RELEASE=v1.3.0
    
RUN mkdir /tmp/build && \
    cd /tmp/build && \
    wget -O src.tar.gz https://github.com/opentripplanner/OpenTripPlanner/archive/$RELEASE.tar.gz && \
    tar xvzf src.tar.gz --strip-components=1 && \
    mvn package -DskipTests && \
    mkdir -p /usr/local/share/java && \
    mv target/otp-*shaded.jar /usr/local/share/java/otp.jar && \
    rm -r /tmp/build ~/.m2/repository


FROM openjdk:8-alpine

ENV JAVA_MX=2G
COPY --from=build /usr/local/share/java/otp.jar /usr/local/share/java/otp.jar
COPY otp /usr/local/bin/

EXPOSE 8080 
ENTRYPOINT ["/usr/local/bin/otp"]
CMD ["--help"]
