node {

  stage('Checkout Souuces') {
    checkout scm
  }

  stage('Build "Java9 compile Environment" docker iamge.') { // for display purposes
    sh "docker build -t oracle-java/java9-plus - < ./src/docker/java9-plus/Dockerfile"
  }

}
