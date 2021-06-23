pipeline {
  agent {
    docker {
       image 'sgoryunov/build_image:latest'
       args '-v /var/run/docker.sock:/var/run/docker.sock -u root:root'
    }
  }

  stages {
    stage('Git clone') {
      steps {
        sh  'rm -rf lesson11'
        sh  'git clone https://github.com/sgoryunov/lesson11.git'
      }
    }

    stage('Build war') {
      steps {
        sh 'cd lesson11 && mvn package'
      }
    }

    stage('Make docker image') {
      steps {
        sh 'ls -al'
        sh 'docker build -t prod_image .'
        sh 'docker tag prod_image sgoryunov/prod_image'
        sh 'cat secret | docker login -u sgoryunov --password-stdin'
        sh 'docker push sgoryunov/prod_image'
      }
    }
    stage('Run docker on prod instance') {
      steps {
        sh 'ssh-keyscan -H 13.49.70.73 >> ~/.ssh/known_hosts'
        sh 'ssh jenkins@13.49.70.73 "docker rm -f one && docker run -d -p 80:8080 --name one sgoryunov/prod_image"'
      }
    }
  }
  // triggers {
  //   // pollSCM('*/1 H * * *')
  // }
}