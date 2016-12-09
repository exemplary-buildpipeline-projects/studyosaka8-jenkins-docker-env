node {

  stage('Checkout Souuces') {
    checkout scm
  }

  stage('Build docker image "Java9 compile env"') {
    sh "docker build -t oracle-java9-plus - < ./src/docker/java9-plus/Dockerfile"
  }

  stage('Build docker image "Deploy target"') {
    sh "docker build -t deploy-target - < ./src/docker/deploy-target/Dockerfile"
  }

}
