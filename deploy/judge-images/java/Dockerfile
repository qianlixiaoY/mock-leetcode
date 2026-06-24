FROM eclipse-temurin:17-jdk-jammy

WORKDIR /workspace

RUN apt-get update && apt-get install -y --no-install-recommends bash curl \
    && curl -fsSL -o /opt/gson.jar \
       https://repo1.maven.org/maven2/com/google/code/gson/gson/2.11.0/gson-2.11.0.jar \
    && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
