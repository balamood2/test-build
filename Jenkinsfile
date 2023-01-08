


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
            try{
                clean = sh(script: "docker rmi \$(docker images -q -f dangling=true)", returnStdout: true)
            }catch (Exception e){
                echo "no imgae to delete " + e.toString()
            }
            
                
        }
    }

    stage ("Deploy") {

        withAWS(credentials:'aws_id', region:'us-east-1') {
            aws_return = sh(script: "aws eks update-kubeconfig --name eks-assesment1 --region us-east-")
            deploy = sh(script: "kubectl describe nodes", returnStdout: true)
        }

    }

}