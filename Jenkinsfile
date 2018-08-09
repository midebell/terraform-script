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
                   withCredentials([string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'), string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')]) {
    // some block
                      sh 'cd /home/ubuntu/terraform/'
                       sh ' terraform plan -var AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} -var AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}'
                     
                     }
            }
        }
        
    }
}
