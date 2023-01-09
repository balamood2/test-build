



node {
    withAWS(credentials:'aws_id', region:'us-east-1') {
        def deployment = "app_deployment.yaml"
        aws_return = sh(script: "aws eks update-kubeconfig --name assesment --region us-east-1", returnStdout: true)
            echo aws_return

        stage("checkout"){
            def gitURL = "https://github.com/balamood2/test-build.git"
            checkout scmGit(
                branches: [[name: 'master']],
                userRemoteConfigs: [[url: "${gitURL}"]])
        }
        stage('Building image') {
            docker.withRegistry('https://index.docker.io/v1/', 'docker') {
                dockerImage = docker.build "balamood/assesment:${env.BUILD_TAG}"
                dockerImage.push()
                /* Remove docker image*/
                try{
                    clean = sh(script: "docker rmi \$(docker images -q -f dangling=true)", returnStdout: true)
                }catch (Exception e){
                    echo "no imgae to delete " + e.toString()
                }
                
                    
            }
        }

        stage ("Deploy") {

                sed_return = sh(script:"sed -i 's/BUILD_TAG/${env.BUILD_TAG}/g' ${deployment}")
                deploy = sh(script: "kubectl apply -f ${deployment}", returnStdout: true)
        }

        stage("Test Deployment"){
            def deployedImage = sh(script: " kubectl get deployment  assesment-app -o  jsonpath=\"{.spec.template.spec.containers[\"0\"].image}\"",
            returnStdout: true).trim()
            
            buildId= deployedImage.split(":")
            echo "build id ${buildId[1]}"
            try{
                if (buildId[1] == env.BUILD_TAG){
                    currentBuild.result = 'SUCCESS'
                    return
                }else{
                    error 'Deployment failed'
                }
            }catch(e){
                throw e
            }
        }
        
    }
}