pipeline {
    agent any
	environment {
    TMPDIR = '/tmp'
	}
    stages {
        stage('Build') { 
            steps {
				
                sh 'cd complete && mvn -B -DskipTests clean package' 
            }
        }
		stage('sonarscan'){
			steps{
				sh '/home/ec2-user/sonar-scanner/sonar-scanner-4.8.0.2856-linux/bin/sonar-scanner -Dsonar.login=sqa_6ae7a164be5e03314cc5863341ce819243d05111'
			}	
		}
		stage('dockerbuild'){
			steps{
					sh 'sudo docker build -t applicationa .'

			}
		}
		stage('dockerpush'){
			steps{
			withCredentials([aws(credentialsId: 'aws-cli-creds', region: 'ap-southeast-1')]) {
				sh 'aws ecr get-login-password --region ap-southeast-1 | sudo docker login --username AWS --password-stdin 314503617348.dkr.ecr.ap-southeast-1.amazonaws.com'
                sh 'sudo docker tag applicationa:latest 314503617348.dkr.ecr.ap-southeast-1.amazonaws.com/applicationa:latest'
				sh 'sudo docker push 314503617348.dkr.ecr.ap-southeast-1.amazonaws.com/applicationa:latest'
                }
			}
			// steps{
			// 	sh 'docker tag applicationa:latest 851584746386.dkr.ecr.ap-southeast-1.amazonaws.com/applicationa:latest'
			// 	sh 'docker push 851584746386.dkr.ecr.ap-southeast-1.amazonaws.com/applicationa:latest'
			// }
		}
		stage('deploy-dockercompose'){
			steps{

				sh 'scp -i "/home/ec2-user/jenkins-jeni.pem" docker-compose.yml ec2-user@ec2-13-212-160-69.ap-southeast-1.compute.amazonaws.com:~/applicationa'
				sh 'ssh -i "/home/ec2-user/jenkins-jeni.pem" ec2-user@ec2-13-212-160-69.ap-southeast-1.compute.amazonaws.com "cd ~/applicationa; sudo docker-compose up -d"'
			}
		}
	}	

    

}