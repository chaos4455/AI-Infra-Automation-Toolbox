import os
import requests
import re
from inquirer import prompt, List, Checkbox, Text

# Chave da API para acesso à geração de conteúdo (mantida como original)
API_KEY = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

# Diretório base para criação dos arquivos .tf do Terraform
BASE_DIRECTORY = 'deploy/terraform'

# Dicionário de perguntas adicionais por provedor de nuvem
additional_questions = {
    'AWS': [
        Checkbox('aws_features',
                 message='Selecione as características desejadas:',
                 choices=[
                     'Replicação',
                     'Alta Disponibilidade',
                     'Redundância',
                     'Backup Automático',
                     'Escalabilidade Automática',
                     'Monitoramento Avançado',
                     'Automação de Deploy',
                     'Balanceamento de Carga',
                     'Rede Virtual Privada (VPN)',
                     'Armazenamento Durável',
                     'Gerenciamento de Identidade',
                     'Controle de Acesso'
                 ]
                 )
    ],
    'Azure': [
        Checkbox('azure_features',
                 message='Selecione as características desejadas:',
                 choices=[
                     'Replicação',
                     'Alta Disponibilidade',
                     'Redundância',
                     'Backup Automático',
                     'Escalabilidade Automática',
                     'Monitoramento Avançado',
                     'Automação de Deploy',
                     'Balanceamento de Carga',
                     'Rede Virtual Privada (VPN)',
                     'Armazenamento Durável',
                     'Gerenciamento de Identidade',
                     'Controle de Acesso'
                 ]
                 )
    ],
    'Google Cloud': [
        Checkbox('gcp_features',
                 message='Selecione as características desejadas:',
                 choices=[
                     'Replicação',
                     'Alta Disponibilidade',
                     'Redundância',
                     'Backup Automático',
                     'Escalabilidade Automática',
                     'Monitoramento Avançado',
                     'Automação de Deploy',
                     'Balanceamento de Carga',
                     'Rede Virtual Privada (VPN)',
                     'Armazenamento Durável',
                     'Gerenciamento de Identidade',
                     'Controle de Acesso'
                 ]
                 )
    ],
    'Outro': [
        Text('other_provider_requirements',
             message='Descreva os requisitos específicos para o provedor de nuvem:'
             )
    ]
}

# Função para enviar requisição à API de geração de conteúdo
def generate_content(prompt_text):
    """
    Envia uma requisição à API de geração de conteúdo para obter uma resposta com base no prompt fornecido.

    Args:
    - prompt_text (str): Texto do prompt para enviar à API.

    Returns:
    - str: Texto gerado pela API em resposta ao prompt.
    """
    content = {
        "contents": [
            {
                "parts": [
                    {
                        "text": prompt_text
                    }
                ]
            }
        ]
    }

    url = f'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key={API_KEY}'

    try:
        response = requests.post(url, json=content)

        if response.status_code == 200:
            json_response = response.json()
            response_text = json_response['candidates'][0]['content']['parts'][0]['text']
            
            # Remover formatações adicionais (como ```tf no início e ``` no final)
            response_text = re.sub(r'^```tf\s*|\s*```$', '', response_text, flags=re.DOTALL).strip()
            
            return response_text
        else:
            print(f"Erro ao enviar requisição: {response.status_code} - {response.text}")
            return None
    except requests.exceptions.RequestException as e:
        print(f"Erro ao enviar requisição: {str(e)}")
        return None
    except Exception as e:
        print(f"Erro inesperado: {str(e)}")
        return None

# Função para criar um diretório se ele não existir
def create_directory(directory):
    """
    Cria um diretório se ele ainda não existir.

    Args:
    - directory (str): Caminho do diretório a ser criado.
    """
    try:
        if not os.path.exists(directory):
            os.makedirs(directory)
    except OSError as e:
        print(f"Erro ao criar diretório '{directory}': {str(e)}")
    except Exception as e:
        print(f"Erro inesperado: {str(e)}")

# Função para criar um arquivo .tf do Terraform com nome único incremental
def create_terraform_tf(resource_name, tf_content):
    """
    Cria um arquivo .tf do Terraform para um recurso específico com um nome único incremental.

    Args:
    - resource_name (str): Nome base do recurso para o qual o arquivo será criado.
    - tf_content (str): Conteúdo do arquivo .tf do Terraform.
    
    Returns:
    - str: Caminho completo do arquivo .tf criado.
    """
    try:
        # Substituir espaços por hífens e criar o nome do arquivo
        normalized_resource_name = resource_name.replace(' ', '-')
        directory = os.path.join(BASE_DIRECTORY, normalized_resource_name)
        create_directory(directory)

        # Verificar se já existe um arquivo com o mesmo nome
        version = 1
        file_path = os.path.join(directory, f'{normalized_resource_name}-v{version}.tf')
        while os.path.exists(file_path):
            version += 1
            file_path = os.path.join(directory, f'{normalized_resource_name}-v{version}.tf')

        # Escrever o conteúdo no arquivo
        with open(file_path, 'w', encoding='utf-8') as file:
            file.write(tf_content)

        print(f"Arquivo .tf do Terraform criado com sucesso para '{resource_name}': {file_path}")
        return file_path
    except OSError as e:
        print(f"Erro ao criar arquivo .tf do Terraform para '{resource_name}': {str(e)}")
        return None
    except Exception as e:
        print(f"Erro inesperado: {str(e)}")
        return None

# Função principal para interagir com o usuário e gerar arquivos .tf do Terraform
def main():
    """
    Função principal que interage com o usuário para obter informações sobre a infraestrutura,
    envia prompts à IA para gerar o conteúdo .tf, cria o arquivo localmente e orienta
    a IA a preencher o arquivo com o conteúdo necessário.
    """
    try:
        print("Bem-vindo! Vamos começar a configurar a infraestrutura como código com arquivos .tf do Terraform.")

        # Perguntar sobre o provedor de nuvem
        provider_questions = [
            List('cloud_provider',
                 message='Escolha o provedor de nuvem:',
                 choices=['AWS', 'Azure', 'Google Cloud', 'Docker', 'Virtualbox', 'Vmware', 'Hyper-v', 'Outro']
                 ),
        ]
        provider_answers = prompt(provider_questions)
        cloud_provider = provider_answers['cloud_provider']

        # Perguntas adicionais com base no provedor de nuvem escolhido
        if cloud_provider in additional_questions:
            answers = prompt(additional_questions[cloud_provider])
        else:
            print("Provedor de nuvem não reconhecido ou sem perguntas adicionais definidas.")

        # Perguntar informações sobre o projeto
        project_questions = [
            Text('project_name', message='Digite o nome do projeto:'),
            Text('project_description', message='Digite uma breve descrição do projeto:')
        ]
        project_answers = prompt(project_questions)
        project_name = project_answers['project_name']
        project_description = project_answers['project_description']

        # Perguntar sobre o recurso Terraform
        resource_questions = [
            Text('resource_name', message='Digite o nome do recurso Terraform:'),
            Text('resource_description', message='Descreva brevemente o recurso:')
        ]
        resource_answers = prompt(resource_questions)
        resource_name = resource_answers['resource_name']
        resource_description = resource_answers['resource_description']

        # Construir o prompt detalhado com base nas respostas
        prompt_text = (
            f"Para o projeto '{project_name}', que é '{project_description}', vamos criar um arquivo .tf para definir um recurso do Terraform.\n\n"
            f"Nome do recurso: {resource_name}\n"
            f"Descrição: {resource_description}\n\n"
            "Sempre declare tudo, porta, IP, namespace, nome, rede, crie tudo, volume, fale com todos, exponha as portas, declare tudo nos mínimos detalhes de acordo com a imagem, o serviço, etc, logins, senhas, configurações, sempre que possível integre, etc, crie algo funcional estado da arte, nunca resuma,  crie algo extremamente detalhado e completo, sempre.\n\n"
            "Certifique-se de incluir todas as configurações necessárias no arquivo .tf, como variáveis, recursos e configurações específicas."
        )
        tf_content = generate_content(prompt_text)

        if tf_content:
            create_terraform_tf(resource_name, tf_content)
        else:
            print("Não foi possível determinar as configurações do arquivo .tf do Terraform.")

        print("Processo de criação do arquivo .tf do Terraform concluído.")
        print(f"Arquivo criado em: {os.path.abspath(BASE_DIRECTORY)}")
    except KeyboardInterrupt:
        print("\nOperação interrompida pelo usuário.")
    except Exception as e:
        print(f"Erro inesperado durante a execução do programa: {str(e)}")

if __name__ == "__main__":
    main()

