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
                sh "mkdir -p artifactory"
                sh "tar --exclude=www/css --exclude=www/js --exclude=.git --exclude=artifactory -zcvf artifactory/artifacts.tar.gz ."
                archiveArtifacts artifacts: 'artifactory/artifacts.tar.gz', fingerprint: true, onlyIfSuccessful: true
            }
        }
        stage('Upload to artifactory') {
            steps {
                rtUpload (
                    serverId: "artifactory.dvrt.xyz", spec:
                        """{
                            "files": [
                                {
                                    "pattern": "artifactory/artifacts.tar.gz",
                                    "target": "example-repo-local/artifact_${BUILD_ID}.tar.gz"
                                }
                            ]
                        }"""
                )
            }
        }
    }
}


