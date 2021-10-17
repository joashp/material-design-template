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
                sh "mkdir artifacts_$BUILD_ID"
                sh "tar --exclude=www/css --exclude=www/js --exclude=.git --exclude=artifacts_$BUILD_ID -zcvf artifacts_$BUILD_ID/artifacts_$BUILD_ID.tar.gz ."
                archiveArtifacts artifacts: 'artifacts_$BUILD_ID/artifacts_$BUILD_ID', fingerprint: true, onlyIfSuccessful: true
            }
        }
        stage ('Upload artifact to Artifactory') {
            steps {
              rtUpload (
                  serverId: 'artifactory.dvrt.xyz',
                  spec:
                      """{
                          "files": [
                               "pattern": "artifct/artifacts.tar.gz",
                               "target": "example-repo-local/artifacts_$BUILD_ID"
                            }
                        ]
                    }"""
                )  
            }
        }
    }
}


