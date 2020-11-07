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
     stage('SonarQube'){
            steps {
                withSonarQubeEnv('SonarQube') {
                   sh "mvn -f apiops-anypoint-bdd-sapi/pom.xml sonar:sonar -Dsonar.host.url=http://localhost:9000 -Dsonar.sources=src/"
           
                }
            }
        }
        stage('Quality Gate'){
            steps {
                script {
                    timeout(time: 1, unit: 'HOURS') { 
                        sh "curl -u admin:admin -X GET -H 'Accept: application/json' http://localhost:9000/api/qualitygates/project_status?projectKey=com.mycompany:apiops-anypoint-bdd-sapi > status.json"
                        def json = readJSON file:'status.json'
                        echo "${json.projectStatus}"
                        if ("${json.projectStatus.status}" != "OK") {
                            currentBuild.result = 'FAILURE'
                            error('Pipeline aborted due to quality gate failure.')
                        }
                    }
                }
            }
        }
   stage('Deploy') {
      steps {
        sh 'mvn -f apiops-anypoint-bdd-sapi/pom.xml package'
      }
    } 

  }

    
  tools {
    maven 'Maven'
  }
}
