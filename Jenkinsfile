node {
  // Clean workspace and checkout
  deletedir
  checkout scm

  // Define the current WORKSPACE
  def workspace = sh returnStdout: true, script: 'pwd'

  // Get the code and build
  stage('Build and Test') {
    sh 'npm install'
    sh 'npm test'
  }

  stage('Build and push Docker image') {
    sh "rm -r ${workspace}/node_modules"
    sh 'npm install --production'
    sh "docker build -f Dockerfile -t localhost:5000/emp_dir:${env.BUILD_NUMBER} ."
    sh "docker push localhost:5000/emp_dir:${env.BUILD_NUMBER}"
  }

}
