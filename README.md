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

