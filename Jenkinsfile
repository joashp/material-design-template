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
						sh 'uglifyjs ./www/js/init.js -c -o /www/min/compressed-js.js'
					}
				}
				stage ('Compressing CSS')
                        	{
                                	steps
                                	{
                                        	sh 'cleancss ./www/css/style.css -o /www/min/compressed-css.css'
                                	}
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
