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
        stage ('Create and archive artifacts') {
            steps {
                sh "mkdir new_artifacts"
                sh "tar --exclude=www/css --exclude=www/js --exclude=.git --exclude=new_artifacts -zcvf new_artifacts/artifacts.tar.gz ."
                archiveArtifacts artifacts: 'new_artifacts/artifacts.tar.gz', fingerprint: true, onlyIfSuccessful: true
            }
        }
    }
}


