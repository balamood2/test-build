

node {

    stage("checkout"){
        def gitURL = "https://github.com/balamood2/test-build.git"
        checkout scmGit(
            branches: [[name: 'master']],
            userRemoteConfigs: [[url: "${gitURL}"]])
    }
    stage('Building image') {
        docker.withRegistry('https://index.docker.io/v1/', 'docker') {
            dockerImage = docker.build "balamood/assesment:${env.BUILD_TAG}"
            //dockerImage.push()
            /* Remove docker image*/
            clean = sh(script: "docker rmi \$(docker images -q -f dangling=true)", returnStdout: true)
                
        }
    }

    stage "Deploy" {
        withKubeConfig([credentialsId: 'kube_config']){
            deploy = sh(script: "kubectl describe nodes", returnStdout: true)
        }
    }

}