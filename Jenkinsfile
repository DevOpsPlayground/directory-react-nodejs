node {

  // Get the code and build
  stage 'Build'
  deleteDir
  git checkout scm
  sh 'npm install'
  sh 'npm test'

  stage 'Package Production'
  sh 'rm -rf ${WORKSPACE}/node_modules'
  sh 'npm install --production'

  stage 'Deploy to Development'
  echo 'Deploying to development server'
  echo 'Smoke test Development'

  stage 'Deploy to Test'
  echo 'Deploying to Test server'
  echo 'Running Regression Tests'
  echo 'Regression Tests Complete'

  stage 'Deploy to Staging'
  echo 'Deploying to Staging server'
  echo 'Smoke test Staging'

  stage 'Deploy to Production'
  echo 'Deploying to Production server'
  echo 'Smoke test Production Done'
}
