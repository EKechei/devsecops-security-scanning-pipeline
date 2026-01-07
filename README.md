# GithubActions-Project

```mermaid
flowchart TB
    B["Build (Docker)"]

    B --> T["Test: Secrets, Bandit, pip-audit"]
    B --> S["Scan (Trivy)"]

    S --> R["Release to Docker Hub"]


