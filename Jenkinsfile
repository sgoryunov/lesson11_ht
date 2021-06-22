pipeline {
  agent {
    docker {
       image 'sgoryunov/build_image:latest'
       args '-v /var/lib/jenkins/workspace/Lesson11_ht:/tmp'
    }
  }

  stages {
    stage('Git clone') {
      steps {
        git 'https://github.com/sgoryunov/lesson11.git'
      }
    }

    stage('Build war') {
      steps {
        sh 'mvn package'
      }
    }

    // stage('Make docker image') {
    //   steps {
    //     sh 'docker build -t prod_image /tmp/'
    //     sh 'docker tag prod_image sgoryunov/prod_image'
    //     sh 'docker login -u sgoryunov -p sophiaHu84'
    //     sh 'docker push sgoryunov/prod_image'
    //   }
    // }

//     stage('Run docker on prod instance') {
//       steps {
//         sh 'ssh-keyscan -H 13.51.107.128 >> ~/.ssh/known_hosts'
//         sh '''ssh jenkins@13.51.107.128 << EOF
// 	sudo docker pull devcvs-srv01:5000/shop2-backend/gateway-api:2-staging
// 	cd /etc/shop/docker
// 	sudo docker-compose up -d
// EOF'''
//       }
//     }
  }
  // triggers {
  //   // pollSCM('*/1 H * * *')
  // }
}