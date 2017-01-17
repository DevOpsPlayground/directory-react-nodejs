node {
  // Clean workspace and checkout
  deleteDir()
  checkout scm

  // Define the current WORKSPACE
  // def workspace = sh returnStdout: true, script: 'pwd'
  echo "Workspace path is now ${env.WORKSPACE}"

  // Get the code and build
  stage('Build and Test') {
    sh '
      export PATH=$PWD/travis_phantomjs/phantomjs-2.1.1-linux-x86_64/bin:$PATH
      if [ $(phantomjs --version) != '2.1.1' ]; then rm -rf $PWD/travis_phantomjs; mkdir -p $PWD/travis_phantomjs; fi
      if [ $(phantomjs --version) != '2.1.1' ]; then wget https://assets.membergetmember.co/software/phantomjs-2.1.1-linux-x86_64.tar.bz2 -O $PWD/travis_phantomjs/phantomjs-2.1.1-linux-x86_64.tar.bz2; fi
      if [ $(phantomjs --version) != '2.1.1' ]; then tar -xvf $PWD/travis_phantomjs/phantomjs-2.1.1-linux-x86_64.tar.bz2 -C $PWD/travis_phantomjs; fi
      phantomjs --version
      # export DISPLAY=:99.0
      # sh -e /etc/init.d/xvfb start
      # "/sbin/start-stop-daemon --start --quiet --pidfile /tmp/custom_xvfb_99.pid --make-pidfile --background --exec /usr/bin/Xvfb -- :99 -ac -screen 0 3840x2160x16"
      sleep 3
      npm config set spin false
     '
    sh 'npm install'
    sh 'npm test'
  }

  stage('Build and push Docker image') {
    sh "rm -rf ${env.WORKSPACE}/node_modules"
    sh 'npm install --production'
    sh "docker build -f Dockerfile -t sameetn/emp_dir:${env.BUILD_NUMBER} ."
    sh "docker push sameetn/emp_dir:${env.BUILD_NUMBER}"
  }

  stage('Deploy to Swarm Cluster') {
    def isPresent = sh returnStdout: true, script: 'docker-machine ssh swarm-master docker service ls | grep emp_dir | tr -s " " " " | cut -d " " -f2'
    echo "Service status is ${isPresent?.trim().equals('emp_dir')}"
    if(isPresent?.trim().equals('emp_dir')) {
      sh "ssh -t root@swarm-master.tmsapp.us 'docker service update --image sameetn/emp_dir:${env.BUILD_NUMBER} emp_dir'"  
    } else {
      sh "ssh -t root@swarm-master.tmsapp.us 'docker service create --name emp_dir sameetn/emp_dir:${env.BUILD_NUMBER}'"
    }
  }
}
