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
                sh 'rm -r *;git clone https://github.com/midebell/terraform-script.git'
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
    }
}
