pipeline {
  agent any
  stages {
    stage('Build') {
      agent {
        docker {
          image 'busybox'
        }

      }
      steps {
        sh 'echo "hello world"'
        sleep 20
        cleanWs(cleanWhenSuccess: true)
      }
    }

  }
}