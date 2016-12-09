node {

  stage('Checkout Souuces') {
    checkout scm
  }

  stage('Build docker image "Java9 compile env"') {
    dir('./src/docker/java9-plus') {
      sh "docker build -t oracle-java9-plus ."
    }
  }

  stage('Build docker image "Deploy target"') {
    dir('./src/docker/deploy-target') {
      sh "docker build -t deploy-target ."
    }
  }

}
