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

        // stage("Wait for EC2 to reboot"){
        //     steps{
        //         script{
        //             sleep(time: 240, unit: 'SECONDS') // Wait 2 minutes after reboot
        //         }
        //     }
        // }
        
       stage('Deploy Application') {
            steps {
                echo "Deploying to EC2 instance at http://${env.EC2_IP}"
                script {
                    try {
                        // Define paths - using normalized Windows paths
                        def sshKeyPath = 'C:\\ProgramData\\Jenkins\\.ssh\\cd_project.pem'
                        bat 'powershell.exe Copy-Item "C:\\ProgramData\\Jenkins\\.ssh\\cd_project.pem" ".\\cd_project.pem"'
                        bat 'powershell.exe icacls ".\\cd_project.pem" /inheritance:r /grant:r SYSTEM:R'

                        // Rest of your deployment steps...
                        bat """
                            scp -i cd_project.pem -o StrictHostKeyChecking=no .\\scripts\\deploy-app.sh ec2-user@${env.EC2_IP}:/home/ec2-user/
                            ssh -i cd_project.pem ec2-user@${env.EC2_IP} "dos2unix /home/ec2-user/deploy-app.sh"
                            ssh -i cd_project.pem ec2-user@${env.EC2_IP} "ls -l /home/ec2-user/deploy-app.sh"
                            ssh -i cd_project.pem -o StrictHostKeyChecking=no ec2-user@${env.EC2_IP} "chmod +x /home/ec2-user/deploy-app.sh"
                            ssh -i cd_project.pem -o StrictHostKeyChecking=no ec2-user@${env.EC2_IP} "EC2_IP=${env.EC2_IP} bash /home/ec2-user/deploy-app.sh"
                        """

                        
                    } catch (Exception e) {
                        echo "Exception occurred: ${e.getMessage()}"
                        error "Failed to deploy application. See logs for details."
                    }
                }
            }
}


    }
    
    post {
        always {
            echo 'Pipeline completed'
            bat 'del cd_project.pem'
            bat 'terraform destroy -auto-approve'
            cleanWs()
        }
        
        success {
            echo 'Pipeline succeeded'
            echo "Application deployed successfully to EC2 instance at ${env.EC2_IP}"
            emailext (
                subject: "✅ CD Pipeline Success - Application Deployed",
                body: """
                <html>
                <body style="font-family: Arial, sans-serif; padding: 20px; background-color: #f4f4f4;">
                    <div style="max-width: 600px; margin: auto; background: white; padding: 20px; border-radius: 8px;">
                        <h2 style="color: #4CAF50;">🚀 Deployment Successful!</h2>
                        <p>Hello Team,</p>
                        <p>The continuous deployment pipeline has successfully deployed the application to the EC2 instance.</p>
                        <table style="width: 100%; margin-top: 20px; border-collapse: collapse;">
                            <tr>
                                <td style="padding: 10px; border: 1px solid #ddd;"><strong>EC2 IP:</strong></td>
                                <td style="padding: 10px; border: 1px solid #ddd;"><a href="http://${env.EC2_IP}:3000" >${env.EC2_IP}</a></td>
                            </tr>
                            <tr>
                                <td style="padding: 10px; border: 1px solid #ddd;"><strong>Status:</strong></td>
                                <td style="padding: 10px; border: 1px solid #ddd;">Success ✅</td>
                            </tr>
                            <tr>
                                <td style="padding: 10px; border: 1px solid #ddd;"><strong>Repository:</strong></td>
                                <td style="padding: 10px; border: 1px solid #ddd;">CD_PROJECT</td>
                            </tr>
                        </table>
                        <p style="margin-top: 20px;">Regards,<br><strong>Jenkins CI/CD</strong></p>
                    </div>
                </body>
                </html>
                """,
                mimeType: 'text/html',
                to: '2200030963@kluniversity.in'
            )
        }

        failure {
            dir('terraform') {
                bat 'terraform destroy -auto-approve'
            }
            echo 'Pipeline failed, destroying infrastructure'
        }
    }
}