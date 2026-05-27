# 1. Tomcat 9 + JDK 11 베이스 이미지 사용
FROM tomcat:9-jdk11

# 2. Tomcat 기본 앱 제거 (충돌 방지 및 / 경로 사용을 위함)
RUN rm -rf /usr/local/tomcat/webapps/*

# 3. 빌드된 WAR 파일을 Tomcat의 webapps 디렉토리로 복사
# pom.xml의 <finalName>ROOT</finalName> 설정에 따라 target/ROOT.war가 생성됩니다.
# 이를 ROOT.war로 복사하면 http://localhost:8181/ 경로로 접속 가능합니다.
COPY target/ROOT.war /usr/local/tomcat/webapps/ROOT.war

# 4. Tomcat 포트 노출
EXPOSE 8080

# 5. Tomcat 실행
CMD ["catalina.sh", "run"]