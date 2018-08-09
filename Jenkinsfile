pipeline {
    agent {
        node {
            label 'master'
        }
    }

    stages {

        stage('terraform started ok') {
            steps {
                sh 'echo "Started...!" '
            }
        }
        stage('git clone') {
            steps {
                sh 'sudo rm -r *; sudo git clone https://github.com/midebell/terraform-script.git'
            }
        }
        stage('tfsvars create'){
            steps {
                sh 'cp /home/ubuntu/terraform/* /var/lib/jenkins/workspace/Terraform-aws/terraform-script/'
            }
        }
        stage('terraform init') {
            steps {
                sh 'terraform init /var/lib/jenkins/workspace/Terraform-aws/terraform-script/'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'ls /var/lib/jenkins/workspace/Terraform-aws/terraform-script; terraform plan /var/lib/jenkins/workspace/Terraform-aws/terraform-script/'
            }
        }
    }
}
