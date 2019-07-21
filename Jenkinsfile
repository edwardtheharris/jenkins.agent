def agentImage
properties([[
	$class: 'GithubProjectProperty',
	projectUrlStr: 'https://github.com/edwardtheharris/jenkins.agent'
]])

ansiColor() {
	node('worker') {
		stage('checkout') {
			checkout scm
		}
		stage('build') {
			agentImage = docker.build('gcr.io/xander-the-harris-jenkins/agent')
		}
		stage('push') {
			withCredentials([
				usernamePassword(credentialsId: 'gcr:xander-the-harris-jenkins',
												 passwordVariable: 'gcr_pass',
												 usernameVariable: 'gcr_user')
			]) {
				docker.withRegistry('https://gcr.io/',
														'gcr:xander-the-harris-jenkins')	{
					agentImage.push()
					agentImage.push(env.BUILD_NUMBER)
				}
			}
		}
	}
}
