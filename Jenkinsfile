

node {

    stage("checkout"){
        def gitURL = "https://github.com/balamood2/test-build.git"
        checkout scmGit(
            branches: [[name: 'master']],
            userRemoteConfigs: [[url: "${gitURL}"]])
    }
    stage('Building image') {
      
        dockerImage = docker.build registry + ":$BUILD_NUMBER"
        
    }

}s