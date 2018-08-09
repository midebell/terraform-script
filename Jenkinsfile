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
                sh 'cp /var/lib/jenkins/workspace/Terraform-aws/terraform-script/* /home/ubuntu/terraform/'
            }
        }
        stage('terraform init') {
            steps {
                sh 'terraform init /home/ubuntu/terraform/'
            }
        }
        
        stage('terraform login') {
            steps {
                   
                       sh 'cd /home/ubuntu/terraform/'
                       sh 'terraform plan access_key="${var.AWS_ACCESS_KEY}" -var secret_key="${var.AWS_SECRET_KEY}"'
     
            }
        }
        
    }
}
