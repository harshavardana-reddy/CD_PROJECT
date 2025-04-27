pipeline {
    agent any
    
    environment {
        SSH_KEY = credentials('EC2-SSH-KEY')
        JWT_SECRET_KEY = credentials('JWT_SECRET_KEY_ECOM')
        DB_URI_ATLAS = credentials('DB_URI_ATLAS_ECOM')
        RAZORPAY_KEY_ID = credentials('RAZORPAY_KEY_ID')
        RAZORPAY_KEY_SECRET = credentials('RAZORPAY_KEY_SECRET')
        VITE_APP_RAZORPAY_KEY = credentials('VITE_APP_RAZORPAY_KEY')
        aws_credential = credentials('AWS-TERRAFORM')
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/harshavardana-reddy/CD_PROJECT.git'
            }
        }
        
        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    bat 'terraform destroy -auto-approve'
                    bat 'terraform init'
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    bat 'terraform apply -auto-approve'
                }
            }
        }
        
        stage('Wait for EC2 Instance to be Ready') {
            steps {
                script {
                    echo "Waiting 30 seconds for EC2 instance to be created..."
                    sleep(time: 30, unit: 'SECONDS')
                }
            }
        }

        stage('Get EC2 IP') {
            steps {
                script {
                    def tfOutput = bat(script: 'terraform output -json', returnStdout: true).trim()
                    
                    // Check if the output is valid JSON
                    echo "Terraform Output: ${tfOutput}"  // Log the output to check it
                    try {
                        def outputs = readJSON(text: tfOutput)
                        env.EC2_IP = outputs.instance_public_ip.value
                    } catch (Exception e) {
                        error "Invalid JSON output: ${e.getMessage()}"
                    }
                }
                echo "EC2 Instance IP: ${env.EC2_IP}"
            }
        }

        stage('Deploy Application') {
            steps {
                sshagent(['ec2-ssh-key']) {
                    bat "scp -o StrictHostKeyChecking=no scripts/deploy-app.sh ec2-user@${env.EC2_IP}:/home/ec2-user/"
                    bat "ssh -o StrictHostKeyChecking=no ec2-user@${env.EC2_IP} 'chmod +x /home/ec2-user/deploy-app.sh && /home/ec2-user/deploy-app.sh'"
                }
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline completed'
        }

        failure{
            dir('terraform') {
                bat 'terraform destroy -auto-approve'
            }
            echo 'Pipeline failed, destroying infrastructure'
        }
    }
}