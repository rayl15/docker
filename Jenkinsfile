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
        sleep 30
        cleanWs(cleanWhenSuccess: true)
      }
    }

  }
}
