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
                script {
                    dir('terraform') {
                        bat 'terraform apply -auto-approve'
                        
                        // Get Terraform output
                        bat 'terraform output -json > output.json'
                        
                        
                        try {
                            // Parse the JSON output
                            def outputs = readJSON file: 'output.json'
                            echo "Terraform Outputs: ${outputs}"
                            env.EC2_IP = outputs.instance_public_ip.value
                        } catch (Exception e) {
                            error "Failed to parse Terraform output: ${e.getMessage()}"
                        }
                    }
                    echo "EC2 Instance IP: ${env.EC2_IP}"
                }
            }
        }

        stage("Wait for EC2 to reboot"){
            steps{
                script{
                    sleep(time: 240, unit: 'SECONDS') // Wait 2 minutes after reboot
                }
            }
        }
        
        stage('Deploy Application') {
            steps {
                echo "Deploying to EC2 instance at ${env.EC2_IP}"
                echo "Using SSH key: ${env.SSH_KEY}"
                script{
                    try{
                        echo "Starting Connection"
                        sshagent(['EC2-SSH-KEY']) {
                            echo "Connected to EC2 instance"
                            echo "Copying files to EC2 instance"
                            bat "ssh -v -o StrictHostKeyChecking=no ec2-user@${env.EC2_IP} 'echo SSH Connected Successfully!'"
                            bat "scp -o StrictHostKeyChecking=no ./scripts/deploy-app.sh ec2-user@${env.EC2_IP}:/home/ec2-user/"
                            bat "ssh -o StrictHostKeyChecking=no ec2-user@${env.EC2_IP} 'chmod +x /home/ec2-user/deploy-app.sh && /home/ec2-user/deploy-app.sh'"
                        }
                    } catch (Exception e) {
                        echo "Exception occurred: ${e.getMessage()}"
                        error "Failed to deploy application."
                    }
                }
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline completed'
        }

        failure {
            dir('terraform') {
                bat 'terraform destroy -auto-approve'
            }
            echo 'Pipeline failed, destroying infrastructure'
        }
    }
}