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
                sh 'cd /home/ubuntu/terraform/'
               // sh 'chown -R jenkins /home/ubuntu/terraform/script2.sh /home/ubuntu/terraform/script3.sh'
                sh 'cd /home/ubuntu/terraform/'
                sh 'chmod -R 777 /home/ubuntu/terraform/script2.sh /home/ubuntu/terraform/script3.sh'
            }
        }
        stage('terraform init') {
            steps {
                sh 'terraform init /home/ubuntu/terraform/'
            }
        }
        
        stage('terraform plan') {
            steps {
                   withCredentials([string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'), string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')]) {
    // some block
                      sh 'cd /home/ubuntu/terraform/'
                       sh 'AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} ${AWS_BIN}'
                       sh '/home/ubuntu/terraform/script2.sh'
                     }
            } 
        }
        
                stage('terraform Apply') {
            steps {
                   withCredentials([string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'), string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')]) {
    // some block
                      sh 'cd /home/ubuntu/terraform/'
                       sh 'AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} ${AWS_BIN}'
                       sh '/home/ubuntu/terraform/script3.sh'
                     }
            } 
        }
         
        stage("foo") {
            steps {
                script {
                    env.RELEASE_SCOPE = input message: 'User input required', ok: 'Release!',
                            parameters: [choice(name: 'RELEASE_SCOPE', choices: 'patch\nminor\nmajor', description: 'What is the release scope?')]
                }
                echo "${env.RELEASE_SCOPE}"
            }
        }
    
    }
}
