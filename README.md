# 🚀 AI-Infra-Automation-Toolbox 💡

### 🌐 [English README](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/english.md) | Explore this portfólio and all another resources in English.

Bem-vindo ao **AI-Infra-Automation-Toolbox**! Este repositório contém uma vasta coleção de exemplos de scripts, templates e ferramentas para provisionamento de ambientes Docker, Kubernetes e Google Cloud, além de configurações de zona de aterrissagem (landzone setup) e outras automações, geradas por inteligencia artificial. 📦🔧

Como profissional de infraestrutura e DevOps, utilizei a AI-Infra-Automation-Toolbox para automatizar o processo de configuração de infraestrutura como código usando Terraform. Aqui está uma análise detalhada da lógica por trás do diagrama:

- **Interação com o Usuário (Inquirer):** Utilizo a biblioteca `inquirer` em Python para criar prompts interativos, permitindo que o usuário selecione o provedor de nuvem (AWS, Azure, Google Cloud, ou outros) e defina características específicas desejadas para a infraestrutura, como alta disponibilidade, escalabilidade automática e gerenciamento de identidade.

- **Geração de Conteúdo com IA (Google Cloud API):** Para gerar configurações detalhadas em arquivos `.tf` do Terraform, integro a aplicação com a API de linguagem generativa do Google Cloud. Envio prompts estruturados à API para obter respostas que são interpretadas e transformadas em configurações de infraestrutura detalhadas, incluindo recursos específicos de cada provedor de nuvem.

- **Criação de Arquivos .tf do Terraform:** Após receber o conteúdo gerado pela IA, o processo automatizado cria arquivos `.tf` estruturados e organizados no diretório específico (`deploy/terraform`). Cada arquivo é nomeado de forma única e incrementada para evitar conflitos, seguindo as melhores práticas de gerenciamento de configuração.
- 
### 🖼️ Exemplos de Uso

#### Gerando Configurações Terraform
![Gerando Configurações Terraform](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/raw/main/assets/py_zfVcFQso1g.png)
*Utilizando um console interativo para especificar provedor e características do arquivo para geração automática de configurações Terraform, por exemplo, ArgoCD no Google Cloud com replicação.*

#### Gerando Arquivos Docker Compose
![Gerando Arquivos Docker Compose](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/raw/main/assets/py_gTEuFtNHKM.png)
*Prompt interativo para especificar nome, características e descrição para geração de arquivos YAML do Docker Compose.*

## Como Executar 🏃‍♂️🚀

### Instalar Dependências:
Para executar este projeto, você precisará instalar as seguintes dependências:
- Python 3.10 ou superior
- Biblioteca `os`
- Biblioteca `requests`
- Biblioteca `re`
- Biblioteca `inquirer`

### Como Instalar:
Você pode instalar as bibliotecas Python necessárias usando o pip:
```bash
pip install os requests re inquirer
```
## Como Obter a Chave da API do Google Gemini 🔑

Para obter a chave da API do Google Gemini, siga estas etapas:

1. Acesse o site do Google AI Studio: [https://ai.google.dev/aistudio](https://ai.google.dev/aistudio).
2. Faça login na sua conta do Google ou crie uma se você ainda não tiver uma.
3. Navegue até a seção de Chave da API dentro do painel do AI Studio.
4. Aceite os termos e condições do Google para usar a API.
5. Gere sua chave da API.
6. Copie a chave da API fornecida.
7. Agora você pode usar esta chave da API em sua aplicação para acessar a API do Google Gemini.

Lembre-se de manter sua chave da API segura e evitar compartilhá-la publicamente para evitar acesso não autorizado aos seus recursos de AI do Google.


---

## 📚 Visão Geral

O **AI-Infra-Automation-Toolbox** foi criado para facilitar o provisionamento e a automação de ambientes complexos utilizando Docker, Kubernetes e Google Cloud. Aqui você encontrará:

- Templates YAML para Docker e Kubernetes.
- Scripts de automação em Python.
- Arquivos de configuração Terraform.
- Scripts Shell para setup de ambiente.

Tudo isso é gerado automaticamente através da API do Google Gemini, que recebe os inputs necessários e gera os arquivos de configuração de forma dinâmica e eficiente. 🧑‍💻✨

## Próximas Atualizações e Expansões 🚀🔧

Estou planejando expandir este projeto em breve com novos templates para Docker Compose 🐳, scripts avançados em PowerShell 🛠️ e scripts otimizados para ambientes Linux 🐧. Além disso, incluirei integração aprofundada com Kubernetes ☸️ para automatização de infraestrutura em escala.

### Visão Futura e Educação 📚💼

O objetivo é transformar este projeto em um recurso abrangente para aprendizado e prática em automação de infraestrutura. Encorajo a comunidade a contribuir com feedback, melhorias e novas funcionalidades para enriquecer ainda mais esta ferramenta!

## Diagrama da Lógica da Aplicação AI-Infra-Automation-Toolbox

![Diagrama da Lógica da Aplicação](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/diagram-export-18-06-2024-22_45_36.png)

Este diagrama exemplifica minha abordagem técnica avançada na automação de infraestrutura, combinando Python, inteligência artificial e práticas de DevOps para proporcionar configurações detalhadas e automatizadas em ambientes de nuvem complexos.


### 🧑‍💼 Como Utilizar o AI-Infra-Automation-Toolbox para Empresas e Profissionais de Mercado

O **AI-Infra-Automation-Toolbox** é uma solução robusta para automatizar e provisionar ambientes de infraestrutura complexos, especialmente voltada para empresas que buscam eficiência e escalabilidade em suas operações de TI. Desenvolvido com foco em profissionais de mercado, este repositório oferece:

#### Como Usar:

1. **Automatização de Infraestrutura**: Utilize os scripts Python para gerar automaticamente configurações YAML para Docker, Kubernetes e Google Cloud, agilizando o processo de provisionamento de ambientes.

2. **Templates Pré-configurados**: Aproveite os templates YAML prontos para uso, otimizados para diferentes cenários de deploy e configurações avançadas como StatefulSets, Ingress e ConfigMaps.

3. **Integração com Google Gemini API**: Interaja diretamente com a Google Gemini API para configurar dinamicamente seus ambientes de infraestrutura, garantindo uma automação eficiente e personalizada.

#### Por que Usar:

- **Eficiência Operacional**: Reduza o tempo gasto na configuração manual de infraestrutura com automações que simplificam e aceleram o processo.

- **Escalabilidade Garantida**: Adapte rapidamente seus ambientes conforme necessidades de crescimento, utilizando ferramentas e práticas recomendadas.

- **Segurança e Confiabilidade**: Implemente melhores práticas de segurança e mantenha a integridade dos seus sistemas com configurações consistentes e testadas.

#### Benefícios para Empresas:

- **Redução de Custos**: Minimize despesas operacionais ao automatizar tarefas repetitivas e simplificar o gerenciamento de recursos.

- **Aumento da Produtividade**: Permita que sua equipe foque em iniciativas estratégicas ao invés de tarefas manuais e administrativas.

- **Competitividade no Mercado**: Mantenha-se à frente da concorrência com uma infraestrutura ágil e flexível que suporta inovação contínua e entregas rápidas.

#### Implementação Ideal:

Utilize o AI-Infra-Automation-Toolbox para configurar desde ambientes de desenvolvimento até soluções de produção escaláveis, integrando-se perfeitamente às suas estratégias de negócio e metas de crescimento.

---

Se você busca otimizar suas operações de TI e escalar suas infraestruturas de forma eficiente, o AI-Infra-Automation-Toolbox é a escolha ideal. Explore nosso repositório para descobrir como podemos ajudar a transformar sua infraestrutura de TI.

---
### Exemplo de Serviço e Deployment Kubernetes para Nginx Cluster

```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-cluster-svc
  namespace: default
  labels:
    app: nginx-cluster
spec:
  type: NodePort  # Define o tipo de serviço como NodePort, permitindo que o serviço seja acessível em cada nó do cluster Kubernetes.
  selector:
    app: nginx-cluster  # Seleciona os pods que este serviço irá direcionar o tráfego, baseado no label 'app: nginx-cluster'.
  ports:
    - port: 80  # Porta exposta pelo serviço. O serviço estará disponível na porta 80 dentro do cluster Kubernetes.
      targetPort: 80  # Porta no pod que será acessada pelo serviço. Neste caso, o Nginx dentro do pod está configurado para escutar na porta 80.
      nodePort: 30080  # Porta no nó do Kubernetes através da qual o serviço será acessível externamente. Qualquer tráfego recebido na porta 30080 de um nó será encaminhado para o serviço na porta 80.
```

```tf
# Arquivo: mysql-cluster.tf

# Recurso para criar o cluster Kubernetes no GCP
resource "google_container_cluster" "mysql-cluster" {
  name        = "mysql-cluster"
  location    = "us-central1"

  # Configuração do pool de nós dentro do cluster MySQL
  node_pools = [
    {
      name         = "default-pool"
      node_count   = 3  # Define o número inicial de nós no pool
      machine_type = "n1-standard-1"  # Tipo de máquina para os nós
      os_image     = "ubuntu"  # Imagem do sistema operacional para os nós
      autoscaling  = {
        min_node_count = 1  # Número mínimo de nós no pool
        max_node_count = 5  # Número máximo de nós no pool
      }
    }
  ]

  control_plane = {
    version = "1.19.2-gke.1900"  # Versão do plano de controle do Kubernetes
    # Consulte a documentação do GKE para personalizar a imagem do pool de controle, se necessário.
    # https://cloud.google.com/kubernetes-engine/docs/concepts/node-images
    # image = "gke-gcr-io/gke-control-plane-v1.19.2-gke.1900"
  }

  legacy_abac = {
    enabled = false  # Desabilita o ABAC legado para o cluster
  }

  network_config = {
    pod_range = "10.244.0.0/14"  # Faixa de IPs para os pods dentro do cluster
  }
}

# Recurso para criar o node pool no cluster MySQL
resource "google_container_node_pool" "mysql-cluster-pool" {
  name         = "mysql-cluster-pool"
  location     = "us-central1"
  cluster      = google_container_cluster.mysql-cluster.name
  node_version = "1.19.2-gke.1900"  # Versão do Kubernetes nos nós do pool
  node_count   = 1  # Número de nós no pool
  # Consulte a documentação do GKE para personalizar a imagem do pool de controle, se necessário.
  # https://cloud.google.com/kubernetes-engine/docs/concepts/node-images
  # image = "gke-gcr-io/gke-nodepool-v1.19.2-gke.1900"
  autoscaling = {
    min_node_count = 1  # Número mínimo de nós no pool
    max_node_count = 3  # Número máximo de nós no pool
  }
}

# Recurso para criar uma conta de serviço no GCP para operações do cluster MySQL
resource "google_service_account" "mysql-cluster-sa" {
  name        = "mysql-cluster-sa"
  display_name = "Service account for MySQL cluster operations"
}

# Recurso para gerar a chave da conta de serviço para o cluster MySQL
resource "google_service_account_key" "mysql-cluster-sa-key" {
  service_account_id = google_service_account.mysql-cluster-sa.id
  key_algorithm      = "RSA_4096"  # Algoritmo de chave para a conta de serviço
  # Salve a chave JSON gerada por este recurso em um local seguro
  # para uso posterior na criação do cluster MySQL.
  private_key_type = "GOOGLE_CREDENTIALS_FILE"
}

# Recurso para criar a instância principal do MySQL no GCP
resource "google_cloud_sql_instance" "mysql-primary" {
  name             = "mysql-primary"
  database_version = "MYSQL_8_0"  # Versão do MySQL para a instância
  backend_type     = "SECOND_GEN"  # Tipo de backend da instância
  machine_type     = "db-n1-standard-2"  # Tipo de máquina para a instância
  activation_policy = "ALWAYS"  # Política de ativação da instância
  # Altere o root_password para uma senha forte e segura.
  root_password = "YOUR_STRONG_PASSWORD_HERE"
  hbr_enabled      = true  # Habilita o backup contínuo
}

# Recurso para criar a réplica do MySQL no GCP
resource "google_cloud_sql_instance" "mysql-replica" {
  name             = "mysql-replica"
  database_version = "MYSQL_8_0"  # Versão do MySQL para a instância réplica
  backend_type     = "SECOND_GEN"  # Tipo de backend da instância réplica
  machine_type     = "db-n1-standard-2"  # Tipo de máquina para a instância réplica
  activation_policy = "ALWAYS"  # Política de ativação da instância réplica
  # Altere o root_password para uma senha forte e segura.
  root_password = "YOUR_STRONG_PASSWORD_HERE"
  failover_replica  = {
    automatic = {
      seconds = 300  # Tempo em segundos para a réplica automática
    }
  }
  replica_configuration = {
    source_instance = google_cloud_sql_instance.mysql-primary.name  # Instância de origem para a réplica
    failover  = {
      automatic = {
        failover_timeout = "5s"  # Tempo limite para failover automático
      }
    }
  }
}

# Recurso para criar um firewall para permitir acesso ao MySQL a partir dos pods do cluster
resource "google_compute_firewall" "mysql-cluster-firewall" {
  name          = "mysql-cluster-firewall"
  network       = "default"
  target_tags   = ["mysql-cluster"]
  allow {
    protocol = "tcp"  # Protocolo TCP para as regras de firewall
    ports    = ["3306"]  # Porta MySQL
    sources  = ["10.0.0.0/8"]  # Intervalo de IP para permitir acesso
  }
}

# Recurso para adicionar um rótulo aos pods do cluster MySQL para identificação pelo firewall
resource "google_container_cluster_resource_label" "mysql-cluster-label" {
  cluster_id = google_container_cluster.mysql-cluster.id
  resource_labels = {
    "app" = "mysql-cluster"  # Rótulo aplicado aos pods
  }
}

# Recurso para expor serviços para acesso externo ao MySQL
resource "google_service_networking_service" "mysql-service" {
  name      = "mysql"
  network   = "default"
  ports     = ["3306"]  # Porta MySQL exposta externamente
  selector {
    app = "mysql-cluster"  # Seletor para identificação dos serviços
  }
}
```

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

## 🤖 Obtendo Chave API do AI Studio

Para utilizar as APIs do AI Studio, siga os passos abaixo para obter sua chave API:

1. Acesse o [AI Studio](https://aistudio.google.com/app/apikey) e faça login com sua conta Google, se necessário.

2. Na página de gerenciamento de chaves API, clique em "Create a new API key" para gerar uma nova chave ou copie uma chave existente, se disponível.

3. Após obter sua chave API, você pode testar a API utilizando curl. Substitua `YOUR_API_KEY` na URL abaixo pelo seu próprio:


```bash
curl \
  -H 'Content-Type: application/json' \
  -d '{"contents":[{"parts":[{"text":"Explain how AI works"}]}]}' \
  -X POST 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=YOUR_API_KEY'


```

## Disclaimer 🛑🤖

### Propósito e Contexto ℹ️

Este projeto, AI-Infra-Automation-Toolbox, utiliza inteligência artificial 🧠 para gerar automaticamente configurações de infraestrutura como código (IaC) com base em prompts fornecidos pelo usuário. O objetivo principal é educacional 📚 e demonstrativo 💡, oferecendo uma ferramenta para estudar automação de infraestrutura em ambientes de nuvem ☁️.

### Instruções de Uso 📋

- **Uso no Trabalho:** Embora este código possa ser utilizado em ambientes de trabalho para fins de aprendizado e prototipagem, recomenda-se fortemente que todas as configurações geradas sejam revisadas e validadas por profissionais qualificados antes de serem aplicadas em produção 🚧.
  
- **Revisão Humana Necessária:** Os resultados obtidos da IA e os arquivos `.tf` gerados devem sempre passar por uma revisão humana detalhada 👩‍💻👨‍💻. Isso inclui verificar a conformidade com as políticas de segurança 🔒, as melhores práticas de infraestrutura 💡, e as especificidades do ambiente de produção 🌐.

- **Isenção de Responsabilidade:** A utilização deste código e dos artefatos gerados pela AI-Infra-Automation-Toolbox é por conta e risco próprios do usuário. Não nos responsabilizamos por quaisquer danos, perdas ou consequências resultantes do uso direto das configurações geradas sem uma revisão adequada 🚫.

### Aviso de Não Utilização em Produção Direta ⚠️

- **Aviso Crítico:** Nunca implemente diretamente em ambiente de produção as configurações geradas por esta aplicação sem uma revisão humana minuciosa e sem considerar todas as implicações de segurança, desempenho e conformidade 🚨.

- **Propósito Educacional:** Este projeto destina-se principalmente a fornecer uma base educacional 📚 e prática 💼 para a automação de infraestrutura. Os usuários são encorajados a adaptar, ajustar e melhorar o código conforme suas necessidades específicas, mas sempre com a devida diligência e cautela 🛡️.

Este disclaimer visa garantir que a AI-Infra-Automation-Toolbox seja utilizada de maneira responsável e segura, respeitando as melhores práticas e garantindo que todas as configurações geradas sejam devidamente revisadas antes de serem aplicadas em ambientes críticos 🔍.

## Licença 📜

Este projeto está licenciado sob os termos da Licença MIT. Consulte o arquivo [LICENSE](https://github.com/chaos4455/AI-Infra-Automation-Toolbox/blob/main/LICENSE) para obter mais detalhes. 📝

### Isenção de Responsabilidade 🚧

Este software é fornecido apenas para fins educacionais e de estudo. Não é recomendado o uso direto em produção sem revisão humana cuidadosa. Os resultados gerados pela IA ou qualquer artefato deste projeto devem ser considerados como base para ajustes e implementações específicas do ambiente. 🤖🧠

### Propósito 🎯

O propósito deste projeto é demonstrar a aplicação de automação de infraestrutura com inteligência artificial. Qualquer uso comercial deve ser feito após ajustes e revisões adequadas para garantir a segurança e adequação ao ambiente de produção. 🚀💼

---

© 2024 Elias Andrade. Todos os direitos reservados. 📅
