

node {

    stage("checkout"){
        def gitURL = "https://github.com/balamood2/test-build.git"
        checkout scmGit(
            branches: [[name: 'master']],
            userRemoteConfigs: [[url: "${gitURL}"]])
    }
    stage('Building image') {
        docker.withRegistry('https://docker.mycorp.com/', 'docker-login') {
            dockerImage = docker.build "testApp:${env.BUILD_TAG}"
        }
        
    }

}