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
                            	cheackout scm
                       }
                }		
		parallel
		{
			stage ('Compressing JS')
			{
				steps
				{
					sh 'uglifyjs /www/js/*.js -c -o /www/min/compressed-js.js'
				}
			}
			stage ('Comprassing CSS')
                        {
                                steps
                                {
                                        sh 'cleancss /www/css/*.css -o /www/min/compressed-css.css'
                                }
                        }
		}
	}
	post
	{
		success
		{
			sh 'echo SUCCESS!!!!!!!!!!!!!!!!!'
		}
	}
}
