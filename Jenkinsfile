

pipeline { 

    agent any 

 

    stages { 

        stage('Checkout') { 

            steps { 

            checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/BarimaBaffour/my-tf-iac-aws-repo.git']]])             

 

          } 

        } 

         

        stage ("terraform init") { 

            steps { 

                sh ('terraform init')  

            } 

        } 

         

        stage ("terraform Action") { 

            steps { 

                echo "Terraform action is --> ${action}" 

                sh ('terraform ${action} --auto-approve')  

           } 

        } 

    } 

} 

 