pipeline {
    agent any
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
				withCredentials([aws(credentialsId: 'aws-cli-creds', region: 'ap-southeast-1')]) {
                    sh 'aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 851584746386.dkr.ecr.ap-southeast-1.amazonaws.com'
					sh 'docker build -t applicationa .'
                }
			}
		}
		stage('dockerpush'){
			withCredentials([aws(credentialsId: 'aws-cli-creds', region: 'ap-southeast-1')]) {
                sh 'docker tag applicationa:latest 851584746386.dkr.ecr.ap-southeast-1.amazonaws.com/applicationa:latest'
				sh 'docker push 851584746386.dkr.ecr.ap-southeast-1.amazonaws.com/applicationa:latest'
                }
			// steps{
			// 	sh 'docker tag applicationa:latest 851584746386.dkr.ecr.ap-southeast-1.amazonaws.com/applicationa:latest'
			// 	sh 'docker push 851584746386.dkr.ecr.ap-southeast-1.amazonaws.com/applicationa:latest'
			// }
		}

    }

}