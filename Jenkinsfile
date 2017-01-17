node {
  // Clean workspace and checkout
  deleteDir()
  checkout scm

  // Define the current WORKSPACE
  // def workspace = sh returnStdout: true, script: 'pwd'
  echo "Workspace path is now ${env.WORKSPACE}"

  // Get the code and build
  stage('Build and Test') {
    sh '''
      npm config set spin false
      npm install --no-optional
      npm test'''
  }

  stage('Build and push Docker image') {
    sh "rm -rf ${env.WORKSPACE}/node_modules"
    sh 'npm install --production'
    sh "docker build -f Dockerfile -t sameetn/emp_dir:${env.BUILD_NUMBER} ."
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: '4420e725-08a2-4769-b97d-2388c41fb006', 
          usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS']]) {
      sh """
        docker login -u \$DOCKER_USER -p \$DOCKER_PASS
        docker push sameetn/emp_dir:${env.BUILD_NUMBER}
      """
    }
  }

  stage('Deploy to Swarm Cluster') {
    def isPresent = sh returnStdout: true, script: "ssh -t root@swarm-master.tmsapp.us 'docker service ls | grep emp_dir | tr -s \" \" \" \" | cut -d \" \" -f2'"
    echo "Service status is ${isPresent?.trim().equals('emp_dir')}"
    if(isPresent?.trim().equals('emp_dir')) {
      sh "ssh -t root@swarm-master.tmsapp.us 'docker service update --replicas 10 --update-delay 1s --update-parallelism 2 --image sameetn/emp_dir:${env.BUILD_NUMBER} emp_dir'"  
    } else {
      sh "ssh -t root@swarm-master.tmsapp.us 'docker service create --replicas 10 --name emp_dir sameetn/emp_dir:${env.BUILD_NUMBER}'"
    }
  }
}
