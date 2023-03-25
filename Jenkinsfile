pipeline {
    agent any
    stages {
        stage('Build') { 
            steps {
				sh 'cd complete'
				sh 'ls -l'
                sh 'cd complete && mvn -B -DskipTests clean package' 
            }
        }
    }
}