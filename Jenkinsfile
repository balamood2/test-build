

node {
  


    stage("checkout"){
       // gitURL = "https://github.com/balamood2/test-build.git"
        checkout scmGit(
            branches: [[name: 'master']],
            userRemoteConfigs: [[url: 'https://github.com/balamood2/test-build.git']])
    }
    stage('Building image') {
      
    }

}