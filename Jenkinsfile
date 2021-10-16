pipeline{
    agent {
        label 'jenkins-agent' //define jenkins agent
    }
    tools {
        nodejs 'nodejs' //define NPM tools
    }
    stages {
        stage ('Compressing') {
            parallel {
                stage('CleanCSS') {
                    steps {
                        nodejs(nodeJSInstallationName: 'nodejs') {
                            sh "cleancss -o www/min/*.css www/css/*.css"
                        }
                    }
                }
                stage ('UglifyJS') {
                    steps {
                        nodejs(nodeJSInstallationName: 'nodejs') {
                            sh "uglifyjs -o www/min/*.js www/js/*.js"
                        }
                    }
                }
            }
        }
        stage ('Archive') {
            steps {
                sh "mkdir artifacts"
                sh "tar --exclude=www/css --exclude=www/js --exclude=.git --exclude=artiacts -zcvf artifacts/artifacts.tar.gz ."
                archiveArtifacts artifacts: "artifacts/artifacts.tar.gz"
            }
        }
    }
}

