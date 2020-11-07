pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'mvn -f apiops-anypoint-bdd-sapi/pom.xml clean install'
      }
    }
    stage('Munit') {
      steps {
        sh 'mvn -f apiops-anypoint-bdd-sapi/pom.xml test'
      }
    }
    
   stage('Deploy') {
      steps {
        sh 'mvn -f apiops-anypoint-bdd-sapi/pom.xml package'
      }
    } 

    

    
  tools {
    maven 'Maven'
  }
}
