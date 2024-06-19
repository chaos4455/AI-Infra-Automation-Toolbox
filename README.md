# 🚀 AI-Infra-Automation-Toolbox 💡

Bem-vindo ao **AI-Infra-Automation-Toolbox**! Este repositório contém uma vasta coleção de scripts, templates e ferramentas para provisionamento de ambientes Docker, Kubernetes e Google Cloud, além de configurações de zona de aterrissagem (landzone setup) e outras automações. 📦🔧

---

## 📜 Índice

- [📚 Visão Geral](#-visão-geral)
- [🏗️ Estrutura do Repositório](#️-estrutura-do-repositório)
- [🚀 Tecnologias Utilizadas](#-tecnologias-utilizadas)
- [🔧 Configuração e Uso](#-configuração-e-uso)
- [🧰 Ferramentas e Automação](#-ferramentas-e-automação)
- [📂 Detalhes dos Arquivos YAML](#-detalhes-dos-arquivos-yaml)
  - [🐳 Deploys Docker](#-deploys-docker)
  - [☸️ Deploys Kubernetes Simples](#-deploys-kubernetes-simples)
  - [🌐 Deploys Kubernetes Complexos](#-deploys-kubernetes-complexos)
- [📊 Diagramas e Referências](#-diagramas-e-referências)
- [🌐 Referências e Recursos](#-referências-e-recursos)
- [👥 Contribuições](#-contribuições)
- [📞 Suporte](#-suporte)
- [📜 Licença MIT](#-licença-mit)

---

## 📚 Visão Geral

O **AI-Infra-Automation-Toolbox** foi criado para facilitar o provisionamento e a automação de ambientes complexos utilizando Docker, Kubernetes e Google Cloud. Aqui você encontrará:

- Templates YAML para Docker e Kubernetes.
- Scripts de automação em Python.
- Arquivos de configuração Terraform.
- Scripts Shell para setup de ambiente.

Tudo isso é gerado automaticamente através da API do Google Gemini, que recebe os inputs necessários e gera os arquivos de configuração de forma dinâmica e eficiente. 🧑‍💻✨

---

## 🏗️ Estrutura do Repositório

A estrutura completa do repositório será detalhada após a inclusão dos arquivos YAML. Abaixo está uma visão geral das categorias de arquivos que serão incluídos:


# Elias Andrade - Portfolio de Automação de Infraestrutura

## 🚀 Introdução

Bem-vindo ao meu portfolio de automação de infraestrutura! Aqui você encontrará uma coleção de ferramentas e scripts desenvolvidos para facilitar o provisionamento e a automação de ambientes complexos de TI. Meu objetivo é oferecer soluções eficientes e escaláveis utilizando as mais recentes tecnologias.

---

## 📁 Projetos Destacados

### 1. **Apache Cluster com Terraform**
   - **Descrição**: Configuração de um cluster Apache utilizando Terraform.
   - **Arquivo**: [apache-cluster-v1.tf](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/apache-cluster-v1.tf)
   - **Detalhes**: Definição de instâncias, grupos de segurança e balanceamento de carga.

### 2. **Balanceamento de Carga com Apache e Nginx**
   - **Descrição**: Configuração YAML para balanceamento de carga entre Apache e Nginx.
   - **Arquivo**: [apache-nginx-load-balance-v1.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/apache-nginx-load-balance-v1.yaml)
   - **Detalhes**: Utilização de ambos os servidores para otimização de tráfego.

### 3. **Configuração do ArgoCD**
   - **Descrição**: Arquivo YAML para implantação e configuração do ArgoCD.
   - **Arquivo**: [argocd-v1.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/argocd-v1.yaml)
   - **Detalhes**: Automatização de processos de implantação e entrega contínua.

### 4. **Scripts de Implantação**
   - **Descrição**: Scripts bash para deploy de diferentes versões de aplicações.
   - **Arquivos**:
     - [deploy-script-v1.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/deploy-script-v1.sh)
     - [deploy-script-v2.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/deploy-script-v2.sh)
     - [deploy-script-v3.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/deploy-script-v3.sh)
     - [deploy-script-v4.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/deploy-script-v4.sh)
     - [deploy-script-v5.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/deploy-script-v5.sh)
     - [deploy-script-v6.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/deploy-script-v6.sh)
     - [deploy-script-v7.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/deploy-script-v7.sh)
   - **Detalhes**: Scripts para automação de deployment em diferentes cenários.

### 5. **Configurações Docker Compose**
   - **Descrição**: Configurações YAML para Docker Compose em várias versões.
   - **Arquivos**:
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
   - **Detalhes**: Configurações para ambientes Docker com diferentes serviços.

### 6. **Scripts Docker**
   - **Descrição**: Scripts shell para operações com Docker.
   - **Arquivos**:
     - [docker-v1.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-v1.sh)
     - [docker-v2.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-v2.sh)
     - [docker-v3.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-v3.sh)
     - [docker-v4.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-v4.sh)
     - [docker-v5.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-v5.sh)
     - [docker-v6.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/docker-v6.sh)
   - **Detalhes**: Scripts para gestão e operação de containers Docker.

### 7. **Configurações MySQL Cluster com Terraform**
   - **Descrição**: Configuração de clusters MySQL utilizando Terraform.
   - **Arquivos**:
     - [mysql-cluster-v1.tf](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/mysql-cluster-v1.tf)
     - [mysql-cluster-v2.tf](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/mysql-cluster-v2.tf)
     - [mysql-cluster-v3.tf](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/mysql-cluster-v3.tf)
     - [mysql-cluster-v4.tf](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/mysql-cluster-v4.tf)
     - [mysql-cluster-v5.tf](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/mysql-cluster-v5.tf)
  
   - **Detalhes**: Provisionamento automatizado de clusters MySQL com Terraform.

### 8. **Configurações Nginx Cluster**
   - **Descrição**: Configurações YAML para clusters Nginx.
   - **Arquivos**:
     - [nginx-cluster-v1.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/nginx-cluster-v1.yaml)
     - [nginx-cluster-v2.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/nginx-cluster-v2.yaml)
     - [nginx-cluster-v3.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/nginx-cluster-v3.yaml)
   - **Detalhes**: Configuração de múltiplas instâncias Nginx para alta disponibilidade.

### 9. **Scripts de Prune**
   - **Descrição**: Script shell para limpeza e otimização de recursos.
   - **Arquivo**: [prune-v1.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/prune-v1.sh)
   - **Detalhes**: Automatização da remoção de recursos não utilizados.

### 10. **Configuração Ubuntu Cluster**
   - **Descrição**: Configuração YAML para cluster Ubuntu.
   - **Arquivo**: [ubuntu-22-cluster-v1.yaml](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/ubuntu-22-cluster-v1.yaml)
   - **Detalhes**: Provisionamento de instâncias Ubuntu em cluster.

### 11. **Scripts de Deploy Ubuntu**
   - **Descrição**: Scripts shell para deploy em sistemas Ubuntu.
   - **Arquivo**: [ubuntu-v1.sh](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/assets/ubuntu-v1.sh)
   - **Detalhes**: Scripts para automatizar tarefas de implantação em Ubuntu.

---

## 🌐 Conclusão

Estes são alguns dos projetos e recursos que desenvolvi para automação de infraestrutura, demonstrando habilidades em diferentes tecnologias como Terraform, Docker, YAML e scripts shell. Cada projeto foi desenhado para aumentar a eficiência, escalabilidade e segurança de ambientes de TI. Espero que este portfolio demonstre meu conhecimento e habilidades para potenciais oportunidades no mercado.

---

## 🚀 Tecnologias Utilizadas

Este projeto utiliza uma variedade de tecnologias e ferramentas para garantir uma configuração eficiente e escalável. As principais tecnologias incluem:

- Docker 🐳
- Kubernetes ☸️
- Google Cloud ☁️
- Terraform 🌍
- Python 🐍
- Google Gemini API 📡
- Shell Script 🐚

---

## 🔧 Configuração e Uso

### 🐳 Docker

**Construir a imagem Docker:**

docker build -t minha-imagem .


🧰 Ferramentas e Automação
📄 Google Gemini API
Os scripts de automação utilizam a Google Gemini API para gerar arquivos YAML e configurações necessárias para Docker, Kubernetes e Terraform. Os scripts Python presentes na pasta automation/ são responsáveis por essa integração.

generate_yaml.py: Gera arquivos YAML com base nos inputs fornecidos.
google_gemini_api.py: Interage com a API do Google Gemini para gerar configurações dinâmicas.
🐍 Scripts Python
generate_yaml.py
google_gemini_api.py
🐚 Shell Scripts
docker/scripts/setup.sh: Script para configuração inicial do Docker.
kubernetes/scripts/setup.sh: Script para configuração inicial do Kubernetes.
📂 Detalhes dos Arquivos YAML
A seguir estão os detalhes dos arquivos YAML que serão incluídos neste repositório, categorizados por tipo e complexidade.

🐳 Deploys Docker
Os arquivos Docker incluem configurações básicas e avançadas para criação de containers e serviços.

Dockerfile: Define a imagem Docker.
docker-compose.yml: Configuração do docker-compose.
setup.sh: Script de configuração inicial do Docker.
☸️ Deploys Kubernetes Simples
Configurações simples do Kubernetes, ideais para ambientes de desenvolvimento e testes rápidos.

deployment.yaml: Configuração de deployment do Kubernetes.
service.yaml: Configuração de serviço do Kubernetes.
configmap.yaml: Configurações de ConfigMap.
secret.yaml: Configurações de Secret.
🌐 Deploys Kubernetes Complexos
Configurações avançadas do Kubernetes, incluindo integrações complexas e setups de produção.

statefulset.yaml: Configuração de StatefulSet para aplicações que necessitam de estado.
ingress.yaml: Configuração de Ingress para controle de entrada de tráfego.
persistentvolume.yaml: Configuração de Persistent Volume.
persistentvolumeclaim.yaml: Configuração de Persistent Volume Claim.
networkpolicy.yaml: Configuração de políticas de rede.
cronjob.yaml: Configuração de CronJob para tarefas agendadas.
📊 Diagramas e Referências
Para facilitar o entendimento e visualização das configurações e fluxos de trabalho, incluiremos diagramas detalhados. Estes diagramas ajudarão a explicar a arquitetura dos deploys complexos e a integração entre diferentes componentes.

Os diagramas estarão disponíveis na pasta diagrams/ e serão referenciados diretamente nos arquivos YAML e na documentação para maior clareza.

🌐 Referências e Recursos
Documentação do Docker
Documentação do Kubernetes
Documentação do Terraform
Google Cloud
Google Gemini API
Outros recursos relevantes conforme necessário.
👥 Contribuições
Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests. Por favor, siga o código de conduta e as diretrizes de contribuição.

