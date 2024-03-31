pipeline {
    agent any

    stages {
        stage('GIT Clone') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/KoushaliyaSree/spring-boot-maven-example-helloworld.git']])
            }
        }

        stage('mvn build')  {
            steps {
                sh 'mvn clean install package'
                sh 'mvn deploy'
                sh 'mvn tomcat9:deploy'

            }
        }

        

    }
}
