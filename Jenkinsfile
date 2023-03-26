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
				sh 'sonar-scanner -Dsonar.login=sqa_6ae7a164be5e03314cc5863341ce819243d05111'
			}	
		}
    }
}