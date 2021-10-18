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
                sh "mkdir -p archive"
                sh "tar --exclude=www/css --exclude=www/js --exclude=.git --exclude=archive -zcvf artchive/artifacts.tar.gz ."
                archiveArtifacts artifacts: 'archive/artifacts.tar.gz', fingerprint: true, onlyIfSuccessful: true
            }
        }
        stage('Upload to artifactory') {
            steps {
                rtUpload (
                    serverId: "artifactory.dvrt.xyz", spec:
                        """{
                            "files": [
                                {
                                    "pattern": "archive/artifacts.tar.gz",
                                    "target": "playtika"
                                }
                            ]
                        }"""
                )
            }
        }
    }
}


