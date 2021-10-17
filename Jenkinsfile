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
                sh "mkdir archi_artf"
                sh "tar --exclude=www/css --exclude=www/js --exclude=.git --exclude=archi_artf -zcvf archi_artf/artifacts.tar.gz ."
                archiveArtifacts artifacts: 'archi_artf/artifacts.tar.gz', fingerprint: true, onlyIfSuccessful: true
            }
        }
        stage ('Add art to artifactory') {
            steps {
              sh "curl -u jenkins : Q!w2e3r4T% -T  'http://artifactory.dvrt.xyz:8081/artifactory/artifactory-build-info/artifacts.tar.gz'"  
            }
        }
    }
}


