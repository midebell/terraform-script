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
        
        stage('terraform plan') {
            steps {
                withCredentials([string(credentialsId: 'AWS_ACCESS_KEY', variable: 'access'), string(credentialsId: 'AWS_SECRET_KEY', variable: 'secret')]) {
    // some block
                sh "AWS_ACCESS_KEY=${AWS_ACCESS_KEY} AWS_SECRET_KEY=${AWS_SECRET_KEY} AWS_DEFAULT_REGION=us-east-1"
              //  sh 'ls /home/ubuntu/terraform/; terraform plan /home/ubuntu/terraform/'
                }             
               
            }
        }
    }
}
