pipeline {
    agent any

    tools {
		maven 'Maven 3.9.6'
	}

    stages {

        stage('Build') {
            steps {
                
                    // Use Maven to build the project (assumes pom.xml is at the root of the project)
                    sh "mvn clean package"
            }
        }

        stage('Deploy') {
            steps {
                // Ensure you have configured Tomcat credentials in Jenkins Credential Store
                script {
                    deploy adapters: [tomcat9(credentialsId: '289321d4-3b25-4a1a-8b37-7b34471eae6d', path: '', url: 'http://localhost:8081')], contextPath: 'SpringBootMavenExample', war: '**/*.war'
                }
            }
        }
    }

    post {
        success {
            echo 'Build and deployment succeeded!'
        }
        failure {
            echo 'Build or deployment failed.'
        }
    }
}

