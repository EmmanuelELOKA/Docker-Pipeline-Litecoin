
node() {

  currentBuild.result = "SUCCESS"
  try {
        // stage 'Checkout'
        //         checkout scm
    
        stage 'Build Image'
                sh '''
                    cd ~
                    docker build -t test .
                   '''
        
        stage 'Scan Image with Anchore'
                sh '''
                    curl -s https://ci-tools.anchore.io/inline_scan-v0.6.0 | bash -s -- -r test:latest
                   '''
        
        stage 'Push Image to ECR'
                sh '''
                    aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 752023216802.dkr.ecr.us-east-2.amazonaws.com
                    docker tag test:latest 752023216802.dkr.ecr.us-east-2.amazonaws.com/test:latest
                    docker push 752023216802.dkr.ecr.us-east-2.amazonaws.com/test:latest
                   '''
                                
        stage 'Manipulate Image Name'
                sh '''
                    cd ~
                    ./manipulate.sh
                   '''
                   
        stage 'Deploy on EKS'
                sh '''
                    cd ~
                    kubectl apply -f statefulset.yml
                   '''
                    
  }
  catch(err) {
      currentBuild.result = "FAILURE"
      throw err
  }
}