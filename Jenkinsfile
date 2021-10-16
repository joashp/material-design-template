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
        stage ('tar') {
            steps {
                sh "mkdir artifact_archive"
                sh "tar --exclude=www/css --exclude=www/js --exclude=.git -zcvf artifact_archive/artifacts.tar.gz ."
                archiveArtifacts artifacts: "artifact_archive/artifacts.tar.gz"
            }
        }
    }
}

