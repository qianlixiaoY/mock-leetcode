@echo off
echo Starting infrastructure...
cd /d %~dp0deploy
docker compose up -d

echo Building judge image...
docker build -t oj-judge-java:latest judge-images/java

echo Done. Start backend and frontend manually:
echo   cd backend ^&^& mvn -pl oj-judge-worker spring-boot:run
echo   cd backend ^&^& mvn -pl oj-api spring-boot:run
echo   cd frontend ^&^& npm install ^&^& npm run dev
