pipeline {
    agent any

    environment {
        TF_VAR_docker_host = "unix:///var/run/docker.sock"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-username/jenkins-terraform-ansible.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                dir('ansible') {
                    sh 'ansible-playbook -i inventory playbook.yml'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded! Infrastructure provisioned and configured.'
        }
        failure {
            echo 'Pipeline failed! Check logs for errors.'
        }
    }
}
