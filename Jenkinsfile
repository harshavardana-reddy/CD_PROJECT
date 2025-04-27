pipeline {
    agent any
    
    environment {
        SSH_KEY              = credentials('ec2-ssh-key')
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
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
        
        stage('Get EC2 IP') {
            steps {
                script {
                    def tfOutput = sh(script: 'terraform output -json', returnStdout: true)
                    def outputs = readJSON text: tfOutput
                    env.EC2_IP = outputs.instance_public_ip.value
                }
                echo "EC2 Instance IP: ${env.EC2_IP}"
            }
        }
        
        stage('Deploy Application') {
            steps {
                sshagent(['ec2-ssh-key']) {
                    sh "scp -o StrictHostKeyChecking=no scripts/deploy-app.sh ec2-user@${env.EC2_IP}:/home/ec2-user/"
                    sh "ssh -o StrictHostKeyChecking=no ec2-user@${env.EC2_IP} 'chmod +x /home/ec2-user/deploy-app.sh && /home/ec2-user/deploy-app.sh'"
                }
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline completed'
        }
    }
}