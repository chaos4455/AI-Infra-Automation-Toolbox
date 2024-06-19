# 🚀 AI-Infra-Automation-Toolbox 💡

Welcome to **AI-Infra-Automation-Toolbox**! This repository contains a vast collection of example scripts, templates, and tools for provisioning Docker, Kubernetes, and Google Cloud environments, as well as landzone setup and other automation. 📦🔧

---
### 🖼️ Example Usage

#### Generating Terraform Configurations
![Generating Terraform Configurations](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/raw/main/assets/py_zfVcFQso1g.png)
*Using an interactive console to specify provider and file characteristics for AI-generated Terraform configurations, e.g., ArgoCD on Google Cloud with replication.*

#### Generating Docker Compose Files
![Generating Docker Compose Files](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/raw/main/assets/py_gTEuFtNHKM.png)
*Interactive prompt for specifying name, characteristics, and description to generate Docker Compose YAML files.*

---

## 📚 Overview

**AI-Infra-Automation-Toolbox** was created to facilitate the provisioning and automation of complex environments using Docker, Kubernetes and Google Cloud. Here you will find:

- YAML templates for Docker and Kubernetes.
- Automation scripts in Python.
- Terraform configuration files.
- Shell scripts for environment setup.

All of this is generated automatically through the Google Gemini API, which receives the necessary inputs and generates configuration files dynamically and efficiently. 🧑‍💻✨

### 🧑‍💼 How to Use AI-Infra-Automation-Toolbox for Companies and Market Professionals

**AI-Infra-Automation-Toolbox** is a robust solution for automating and provisioning complex infrastructure environments, especially aimed at companies seeking efficiency and scalability in their IT operations. Developed with a focus on market professionals, this repository offers:

#### How to use:

1. **Infrastructure Automation**: Use Python scripts to automatically generate YAML configurations for Docker, Kubernetes and Google Cloud, speeding up the environment provisioning process.

2. **Pre-configured Templates**: Take advantage of ready-to-use YAML templates, optimized for different deployment scenarios and advanced configurations such as StatefulSets, Ingress and ConfigMaps.

3. **Integration with Google Gemini API**: Interact directly with the Google Gemini API to dynamically configure your infrastructure environments, ensuring efficient and personalized automation.

#### Why Use:

- **Operational Efficiency**: Reduce the time spent on manually configuring infrastructure with automations that simplify and speed up the process.

- **Guaranteed Scalability**: Quickly adapt your environments according to growth needs, using recommended tools and practices.

- **Security and Reliability**: Implement best security practices and maintain the integrity of your systems with consistent and tested configurations.

#### Benefits for Companies:

- **Cost Reduction**: Minimize operational expenses by automating repetitive tasks and simplifying resource management.

- **Increased Productivity**: Allow your team to focus on strategic initiatives instead of manual and administrative tasks.

- **Market Competitiveness**: Stay ahead of the competition with an agile and flexible infrastructure that supports continuous innovation and fast deliveries.

#### Ideal Implementation:

Use the AI-Infra-Automation-Toolbox to configure everything from development environments to scalable production solutions, seamlessly integrating with your business strategies and growth goals.

---

If you are looking to optimize your IT operations and scale your infrastructures efficiently, AI-Infra-Automation-Toolbox is the ideal choice. Explore our repository to discover how we can help transform your IT infrastructure.

---

## 🏗️ Repository Structure

The complete repository structure will be detailed after including the YAML files. Below is an overview of the file categories that will be included:


# Elias Andrade - Infrastructure Automation Portfolio

## 🚀 Introduction

Welcome to my infrastructure automation portfolio! Here you will find a collection of tools and scripts designed to facilitate the provisioning and automation of complex IT environments. My goal is to offer efficient and scalable solutions using the latest technologies.

### Kubernetes Service and Deployment Example for Nginx Cluster

```yaml
apiVersion: v1
kind: Service
metadata:
 name: nginx-cluster-svc
 namespace: default
 labels:
 app: nginx-cluster
spec:
 type: NodePort # Sets the service type to NodePort, allowing the service to be accessible on every node in the Kubernetes cluster.
 selector:
 Thepp: nginx-cluster # Selects the pods that this service will direct traffic to, based on the label 'app: nginx-cluster'.
 ports:
 - port: 80 # Port exposed by the service. The service will be available on port 80 within the Kubernetes cluster.
 targetPort: 80 # Port on the pod that will be accessed by the service. In this case, Nginx inside the pod is configured to listen on port 80.
 nodePort: 30080 # Port on the Kubernetes node through which the service will be accessible externally. Any traffic received on port 30080 from a node will be forwarded to the service on port 80.
```

```tf
# File: mysql-cluster.tf

# Feature to create Kubernetes cluster on GCP
resource "google_container_cluster" "mysql-cluster" {
 name = "mysql-cluster"
 location = "us-central1"

 # Node pool configuration within the MySQL cluster
 node_pools = [
 {
 name = "default-pool"
 node_count = 3 # Sets the initial number of nodes in the pool
 machine_type = "n1-standard-1" # Machine type for nodes
 os_image = "ubuntu" # OS image for nodes
 autoscaling = {
 min_node_count = 1 # Minimum number of nodes in the pool
 max_node_count = 5 # Maximum number of nodes in the pool
 }
 }
 ]

 control_plane = {
 version = "1.19.2-gke.1900" # Kubernetes control plane version
 # See the GKE documentation to customize the control pool image if necessary.
 # https://cloud.google.com/kubernetes-engine/docs/concepts/node-images
 # image = "gke-gcr-io/gke-control-plane-v1.19.2-gke.1900"
 }

 legacy_abac = {
 enabled = false # Disables legacy ABAC for the cluster
 }

 network_config = {
 pod_range = "10.244.0.0/14" # IP range for pods within the cluster
 }
}

# Feature to create node pool in MySQL cluster
resource "google_container_node_pool" "mysql-cluster-pool" {
 name = "mysql-cluster-pool"
 location = "us-central1"
 cluster = google_container_cluster.mysql-cluster.name
 node_version = "1.19.2-gke.1900" # Kubernetes version on pool nodes
 node_count = 1 # Number of nodes in the pool
 # See the GKE documentation to customize the control pool image if necessary.
 # https://cloud.google.com/kubernetes-engine/docs/concepts/node-images
 # image = "gke-gcr-io/gke-nodepool-v1.19.2-gke.1900"
 autoscaling = {
 min_node_count = 1 # Minimum number of nodes in the pool
 max_node_count = 3 # Maximum number of nodes in the pool
 }
}

# Feature to create a service account in GCP for MySQL cluster operations
resource "google_service_account" "mysql-cluster-sa" {
 name = "mysql-cluster-sa"
 display_name = "Service account for MySQL cluster operations"
}

# Feature to generate service account key for MySQL cluster
resource "google_service_account_key" "mysql-cluster-sa-key" {
 service_account_id = google_service_account.mysql-cluster-sa.id
 key_algorithm = "RSA_4096" # Key algorithm for the service account
 # Save the JSON key generated by this feature in a safe location
 # for later use in creating the MySQL cluster.
 private_key_type = "GOOGLE_CREDENTIALS_FILE"
}

# Feature to create MySQL main instance on GCP
resource "google_cloud_sql_instance" "mysql-primary" {
 name = "mysql-primary"
 database_version = "MYSQL_8_0" # MySQL version for the instance
 backend_type = "SECOND_GEN" # Instance backend type
 machine_type = "db-n1-standard-2" # Machine type for the instance
 activation_policy = "ALWAYS" # Instance activation policy
 # Change the root_password to a strong and secure password.
 root_password = "YOUR_STRONG_PASSWORD_HERE"
 hbr_enabled = true # Enables continuous backup
}

# Feature to create MySQL replica on GCP
resource "google_cloud_sql_instance" "mysql-replica" {
 name = "mysql-replica"
 database_version = "MYSQL_8_0" # MySQL version for the replica instance
 backend_type = "SECOND_GEN" # Backend type of the replica instance
 machine_type = "db-n1-standard-2" # Machine type for the replica instance
 activation_policy = "ALWAYS" # Replica instance activation policy
 # Change the root_password to a strong and secure password.
 root_password = "YOUR_STRONG_PASSWORD_HERE"
 failover_replica = {
 automatic = {
 seconds = 300 # Time in seconds for automatic replication
 }
 }
 replica_configuration = {
 source_instance = google_cloud_sql_instance.mysql-primary.name # Source instance for the replica
 failover = {
 automatic = {
 failover_timeout = "5s" # Timeout for automatic failover
 }
 }
 }
}

# Feature to create a firewall to allow access to MySQL from cluster pods
resource "google_compute_firewall" "mysql-cluster-firewall" {
 name = "mysql-cluster-firewall"
 network = "default"
 target_tags = ["mysql-cluster"]
 allow {
 protocol = "tcp" # TCP protocol for firewall rules
 ports = ["3306"] # MySQL port
 sources = ["10.0.0.0/8"] # IP range to allow access
 }
}

# Feature to add a label to MySQL cluster pods for identification by the firewall
resource "google_container_cluster_resource_label" "mysql-cluster-label" {
 cluster_id = google_container_cluster.mysql-cluster.id
 resource_labels = {
 "app" = "mysql-cluster" # Label applied to pods
 }
}

# Feature to expose services for external access to MySQL
resource "google_service_networking_service" "mysql-service" {
 name = "mysql"
 network = "default"
 ports = ["3306"] # Externally exposed MySQL port
 selector {
 app = "mysql-cluster" # Selector for identifying services
 }
}
```

## 📁 Featured Projects

### 1. **Apache Cluster with Terraform**
 - **Description**: Configuring an Apache cluster using Terraform.
 - **File**: [apache-cluster-v1.tf](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/apache-cluster-v1.tf)
 - **Details**: Definition of instances, security groups and load balancing.

### 2. **Load Balancing with Apache and Nginx**
 - **Description**: YAML configuration for load balancing between Apache and Nginx.
 - **File**: [apache-nginx-load-balance-v1.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/apache-nginx-load -balance-v1.yaml)
 - **Details**: Use of both servers to optimize traffic.

### 3. **ArgoCD Configuration**
 - **Description**: YAML file for deploying and configuring ArgoCD.
 - **File**: [argocd-v1.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/argocd-v1.yaml)
 - **Details**: Automation of deployment and continuous delivery processes.

### 4. **Deployment Scripts**
 - **Description**: Bash scripts for deploying different versions of applications.
 - **Files**:
 - [deploy-script-v1.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/deploy-script-v1.sh)
 - [deploy-script-v2.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/deploy-script-v2.sh)
 - [deploy-script-v3.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/deploy-script-v3.sh)
 - [deploy-script-v4.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/deploy-script-v4.sh)
 - [deploy-script-v5.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/deploy-script-v5.sh)
 - [deploy-script-v6.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/deploy-script-v6.sh)
 - [deploy-script-v7.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/deploy-script-v7.sh)
 - **Details**: Scripts for deployment automation in different scenarios.

### 5. **Docker Compose Settings**
 - **Description**: YAML configurations for Docker Compose in various versions.
 - **Files**:
 - [docker-compose-apache-v1.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-compose-apache-v1.yaml)
 - [docker-compose-apache-v2.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-compose-apache-v2.yaml)
 - [docker-compose-apache-v3.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-compose-apache-v3.yaml)
 - [docker-compose-apche-v1.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-compose-apche-v1.yaml)
 - [docker-compose-mysql,-v1.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-compose-mysql,-v1.yaml)
 - [docker-compose-mysql-v1.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-compose-mysql-v1.yaml)
 - [docker-compose-mysql-v2.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-compose-mysql-v2.yaml)
 - [docker-compose-mysql-v3.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-compose-mysql-v3.yaml)
 - [docker-compose-mysql-v4.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-compose-mysql-v4.yaml)
 - [docker-compose-mysql-v5.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-compose-mysql-v5.yaml)
 - [docker-compose-mysql-v6.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-compose-mysql-v6.yaml)
 - [docker-compose-mysql-v7.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-compose-mysql-v7.yaml)
 - [docker-compose-nginx-v1.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-compose-nginx-v1.yaml)
 - [docker-compose-nginx-v2.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-compose-nginx-v2.yaml)
 - [docker-compose-node-v1.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-compose-node-v1.yaml)
 - [docker-compose-python-v1.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-compose-python-v1.yaml)
 - [docker-compose-v2.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-compose-v2.yaml)
 - [docker-compose.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-compose.yaml)
 - **Details**: Settings for Docker environments with different services.

### 6. **Docker Scripts**
 - **Description**: Shell scripts for Docker operations.
 - **Files**:
 - [docker-v1.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-v1.sh)
 - [docker-v2.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-v2.sh)
 - [docker-v3.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-v3.sh)
 - [docker-v4.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-v4.sh)
 - [docker-v5.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-v5.sh)
 - [docker-v6.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-v6.sh)
 - **Details**: Scripts for managing and operating Docker containers.

### 7. **MySQL Cluster Settings with Terraform**
 - **Description**: Configuration of MySQL clusters using Terraform.
 - **Files**:
 - [mysql-cluster-v1.tf](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/mysql-cluster-v1.tf)
 - [mysql-cluster-v2.tf](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/mysql-cluster-v2.tf)
 - [mysql-cluster-v3.tf](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/mysql-cluster-v3.tf)
 - [mysql-cluster-v4.tf](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/mysql-cluster-v4.tf)
 - [mysql-cluster-v5.tf](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/mysql-cluster-v5.tf)

 - **Details**: Automated provisioning of MySQL clusters with Terraform.

### 8. **Nginx Cluster Settings**
 - **Description**: YAML configurations for Nginx clusters.
 - **Files**:
 - [nginx-cluster-v1.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/nginx-cluster-v1.yaml)
 - [nginx-cluster-v2.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/nginx-cluster-v2.yaml)
 - [nginx-cluster-v3.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/nginx-cluster-v3.yaml)
 - **Details**: Configuration of multiple Nginx instances for high availability.

### 9. **Prune Scripts**
 - **Description**: Shell script for cleaning and optimizing resources.
 - **File**: [prune-v1.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/prune-v1.sh)
 - **Details**: Automation of removal of unused resources.

### 10. **Ubuntu Cluster Configuration**
 - **Description**: YAML configuration for Ubuntu cluster.
 - **File**: [ubuntu-22-cluster-v1.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/ubuntu-22-cluster-v1 .yaml)
 - **Details**: Provisioning of clustered Ubuntu instances.

### 11. **Ubuntu Deploy Scripts**
 - **Description**: Shell scripts for deployment on Ubuntu systems.
 - **File**: [ubuntu-v1.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/ubuntu-v1.sh)
 - **Details**: Scripts to automate deployment tasks in Ubuntu.

---

## 🌐 Conclusion

These are some of the projects and resources I developed for infrastructure automation, demonstrating skills in different technologies such as Terraform, Docker, YAML and shell scripts. Each project was designed to increase the efficiency, scalability and security of IT environments. I hope this portfolio demonstrates my knowledge and skills for potential opportunities in the market.

---

## 🚀 Technologies Used

This project uses a variety of technologies and tools to ensure an efficient and scalable configuration. Key technologies include:

- Docker 🐳
- Kubernetes ☸️
- Google Cloud ☁️
- Terraform 🌍
- Python 🐍
- Google Gemini API 📡
- Shell Script 🐚

---

## 🔧 Configuration and Use

## 🤖 Getting AI Studio API Key

To use AI Studio APIs, follow the steps below to obtain your API key:

1. Go to [AI Studio](https://aistudio.google.com/app/apikey) and log in with your Google account if necessary.

2. On the API key management page, click "Create a new API key" to generate a new key or copy an existing key if available.

3. After obtaining your API key, you can test the API using curl. Replace `YOUR_API_KEY` in the URL below with your own:


```bash
curl \
 -H 'Content-Type: application/json' \
 -d '{"contents":[{"parts":[{"text":"Explain how AI works"}]}]}' \
 -X POST 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=YOUR_API_KEY'


```
