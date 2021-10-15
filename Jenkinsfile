pipeline {
    agent any
    tools {
        nodejs 'nodejs'
    }
    stages {
        stage('Example') {
            steps {
                echo "Running this ${env.BUILD_ID} on ${env.JENKINS_URL}"
            }
        }
    }
}
