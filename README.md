# 🚀 Flask GKE Application – Deployment on Google Kubernetes Engine
## 📘 Project Overview

This project is a simple Flask web application containerized with Docker and  deployed on Google Kubernetes Engine (GKE).
It demonstrates proficiency with Kubernetes, Docker, and Google Cloud Platform (GCP) by hosting a web service accessible through a public Load Balancer.

## ⚙️ Project Architecture

```bash
.
├── gke-app
│   ├── app
│   │   ├── Dockerfile
│   │   ├── app.py
│   │   └── requirements.txt
│   └── k8s
│       ├── deployment.yaml
│       ├── namespace.yaml
│       └── service.yaml
└── infra
    ├── main.tf
    ├── outputs.tf
    ├── providers.tf
    ├── terraform.tfstate
    ├── terraform.tfstate.backup
    └── variables.tf
```

# 🧰 Technologies Used

* **Python** / Flask
* **Docker** to build the image 
* **Google Kubernetes Engine (GKE)** to orchastrate containers
* **Google Artifact Registry** to stores Docker images
* **Terraform** to deploy the infra on GCP
