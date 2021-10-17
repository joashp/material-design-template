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
                sh "mkdir arch_artf"
                sh "tar --exclude=www/css --exclude=www/js --exclude=.git --exclude=arch_artf -zcvf arch_artf/artifacts.tar.gz ."
                archiveArtifacts artifacts: 'arch_artf/artifacts.tar.gz', fingerprint: true, onlyIfSuccessful: true
            }
        }
        stage ('Transmit to artifactory') {
		    steps {
			    withCredentials([usernamePassword(credentialsId: 'artifactory', usernameVariable: 'jenkins', passwordVariable: 'Q!w2e3r4T%')]) {
			   	sh "curl -u${USERNAME}:${PASSWORD} -T arch_artf/artifacts.tar.gz \"http://artifactory.dvrt.xyz:8081/artifactory/assessment2/artifacts${env.BUILD_NUMBER}.tar.gz\""
			    }
			    echo "Success"
    }
}
}
}


