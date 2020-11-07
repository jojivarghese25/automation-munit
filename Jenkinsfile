pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'mvn -f apiops-anypoint-bdd-sapi/pom.xml clean install'
      }
    }

    stage('Deploy') {
      steps {
        sh 'mvn -f apiops-anypoint-bdd-sapi/pom.xml package'
      }
    }

    stage('IntegerationTesting') {
      steps {
        sh 'mvn -f apiops-anypoint-bdd-sapi/pom.xml failsafe:integration-test'
      }
    }

    stage('Email') {
      steps {
        emailext(subject: 'Cucumber Reports', body: 'Attached the body', attachLog: true, attachmentsPattern: 'target/cucumber-reports/report.html', from: 'testmailsnjc@njc.com', mimeType: 'text/html', to: 'vikas_mullana@yahoo.com')
      }
    }

  }
  tools {
    maven 'Maven'
  }
}