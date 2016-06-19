node {

  // Add the tools to the path
  def nodeHome = tool name: 'Node-6.2.1', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
  def dockerTool = tool name: 'Docker-1.12.0'
  env.PATH = "${nodeHome}:${dockerTool}:${env.PATH}"

  // Define the current WORKSPACE
  sh 'pwd > pwd.current'
  workspace = readFile('pwd.current').trim()

  // Get the code and build
  stage 'Build'
  checkout scm
  withDockerContainer(image: 'mhart/alpine-node', toolName: 'Docker-1.12.0') {
    sh 'npm install'
    sh 'npm test'
  }

  stage 'Package Production'
  sh "rm -r ${workspace}/node_modules"
  sh 'npm install --production'
  sh 'tar czf emp-directory.tar.gz --exclude=.git* --exclude=pwd.current --exclude=*.gz --exclude=.travis.* --exclude=*file .'
  archive 'emp-directory.tar.gz'

  stage 'Deploy to Development'
  sleep 1
  echo 'Deployed to development server'
  sleep 2
  echo 'Smoke tested Development'

  stage 'Deploy to Test'
  sleep 1
  echo 'Deployed to Test server'

  stage 'Regression Test'
  sleep 5
  echo 'Regression Tests Complete'

  stage 'Deploy to Staging'
  sleep 1
  echo 'Deployed to Staging server'
  sleep 2
  echo 'Smoke tested Staging'

  stage 'Deploy to Production'
  sleep 1
  echo 'Deployed to Production server'
  sleep 2
  echo 'Smoke tested Production'
}
