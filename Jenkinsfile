

node {
  

  stages {
    stage("checkout"){
        def gitURL = "https://github.com/balamood2/test-build.git"
        checkout scmGit(
            branches: [[name: 'master']],
            userRemoteConfigs: [[url: ${gitUrl}]])
    }
    stage('Building image') {
      steps{
        
      }
    }
  }
}