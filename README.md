# GithubActions-Project

      flowchart TB
    B[Build<br/>(Docker)]

    B --> T[Test<br/>(Secrets<br/>Bandit<br/>pip-audit)]
    B --> S[Scan<br/>(Trivy)]

    S --> R[Release<br/>DockerHub]

