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
                sh "mkdir artfct"
                sh "tar --exclude=www/css --exclude=www/js --exclude=.git --exclude=artfct -zcvf artfct/artifacts.tar.gz ."
                archiveArtifacts artifacts: "artfct/artifacts.tar.gz"
            }
        }
    }
}

