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
                sh "mkdir 2_archive"
                sh "tar --exclude=www/css --exclude=www/js --exclude=.git --exclude=2_archive -zcvf 2_archive/artifacts.tar.gz ."
                archiveArtifacts artifacts: "2_archive/artifacts.tar.gz"
            }
        }
    }
}

