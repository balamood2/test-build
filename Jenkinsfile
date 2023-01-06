

node {
  

  stages {
    stage("checkout"){
        def gitURL = "https://github.com/balamood2/test-build.git"
        checkout([
            $class: 'GitSCM',
            branches: [[name: ${env.GIT_COMMIT}]],
            doGenerateSubmoduleConfigurations: false,
            extensions: [],
            submoduleCfg: [],
            userRemoteConfigs: [[url: ${gitUrl}]]])
    }
    stage('Building image') {
      steps{
        script {
          docker.build registry + ":env.${BUILD_NUMBER}"
        }
      }
    }
  }
}