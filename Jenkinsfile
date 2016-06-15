node {

  // Define the nodeJS path to use in later stages
  def nodeHome = tool name: 'Node-6.2.1', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
  env.PATH = "${nodeHome}:${env.PATH}"

  // Define the current WORKSPACE
  sh 'pwd > pwd.current'
  workspace = readFile('pwd.current')
  echo "Workspace is ${workspace}"
  echo "node_modules are at ${workspace}/node_modules"
  sh "ls -la ${workspace}/node_modules"

  // Get the code and build
  stage 'Build'
  checkout scm
  sh 'npm install'
  sh 'npm test'

  stage 'Package Production'
  sh "rm -r ${workspace}/node_modules"
  sh 'npm install --production'

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
