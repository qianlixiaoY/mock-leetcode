FROM eclipse-temurin:17-jdk-jammy

WORKDIR /workspace

RUN apt-get update && apt-get install -y --no-install-recommends bash \
    && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
