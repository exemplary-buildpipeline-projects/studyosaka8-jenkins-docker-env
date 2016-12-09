node {

  stage('Checkout Souuces') {
    checkout scm
  }

  stage('Build docker image "Java9 compile env"') {
    sh "docker build -t oracle-java/java9-plus - < ./src/docker/java9-plus/Dockerfile"
  }

}
