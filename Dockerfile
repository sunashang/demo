FROM java:8
VOLUME /tmp
ADD /target/*.jar app.jar
RUN bash -c 'touch /app.jar'
EXPOSE 8089
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=pro","-jar","/app.jar"]