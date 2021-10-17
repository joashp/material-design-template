pipeline
{
	agent
	{
		label 'agent'	
	}
	tools
	{
		nodejs 'nodejs16'
	}
	stages
	{
        stage ('Checkout Repository')
        {
            steps
            {
                checkout scm
            }
		}
		stage ('Compressing')
		{
			parallel
			{
				stage ('Compressing JS')
				{
					steps
					{
						sh 'uglifyjs ./www/js/* -c -o ./www/min/compressed-js.js'
					}
				}
				stage ('Compressing CSS')
                {
                    steps
                    {
                        sh 'cleancss ./www/css/* -o ./www/min/compressed-css.css'
                    }
                }
            }
        }
        stage ('Archiving files into TAR')
        {
            steps
            {
                sh 'tar --exclude-vcs --exclude=www/js --exclude=www/css -cvf build.tar .'    
            }
        }
        stage ('Archiving artifacts to Jenkins')
        {
            steps
            {
                archiveArtifacts artifacts: '*.tar', followSymlinks: false    
            }
        }
	}
}
