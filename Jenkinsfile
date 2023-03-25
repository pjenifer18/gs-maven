pipeline {
    agent any
    stages {
        stage('Build') { 
            steps {
				sh 'cd complete'
				sh 'ls -l'
                sh 'mvn -B -DskipTests clean package' 
            }
        }
    }
}