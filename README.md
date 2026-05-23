# TrendStore DevOps Project

## Project Overview

This project demonstrates complete DevOps implementation for the TrendStore application using:

- AWS EC2
- Docker
- DockerHub
- Jenkins CI/CD
- Terraform
- Kubernetes (EKS)
- Prometheus
- Grafana

---

# Architecture

GitHub → Jenkins → Docker → DockerHub → Kubernetes → Monitoring

---

# Technologies Used

- ReactJS
- Docker
- Jenkins
- AWS EC2
- AWS EKS
- Terraform
- Kubernetes
- Prometheus
- Grafana

---

# Docker Commands

## Build Image

docker build -t trendstore-app .

## Run Container

docker run -d -p 3000:3000 trendstore-app

---

# Kubernetes Commands

kubectl apply -f deployment.yaml

kubectl apply -f service.yaml

kubectl get pods

kubectl get svc

---

# Jenkins Pipeline

1. Build Docker Image
2. Docker Login
3. Push Docker Image
4. Kubernetes Deployment

---

# Monitoring

- Prometheus for metrics collection
- Grafana for dashboard visualization

---

# DockerHub Repository

https://hub.docker.com/r/30727/trendstore-app

---

# Application Output

Application deployed successfully on Kubernetes.

---

# Author

Sasikumar
