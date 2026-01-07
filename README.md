# GithubActions-Project

          ┌──────────┐
          │  Build   │
          │ (Docker) │
          └────┬─────┘
               │
     ┌─────────┴─────────┐
     │                   │
┌────▼────┐         ┌────▼────┐
│  Test   │         │  Scan   │
│(Secrets │         │ (Trivy) │
│ Bandit  │         └────┬────┘
│ pip-aud)│              │
└─────────┘         ┌────▼────┐
                    │ Release │
                    │DockerHub│
                    └─────────┘
