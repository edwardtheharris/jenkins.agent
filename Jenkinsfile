def agentImage
properties([[
	$class: 'GithubProjectProperty',
	projectUrlStr: 'https://github.com/edwardtheharris/jenkins.agent'
]])

ansiColor() {
	node('worker') {
		withCredentials([
				usernamePassword(credentialsId: 'gcr:xander-the-harris-jenkins',
												 passwordVariable: '',
												 usernameVariable: '')
		]) {
			docker.withRegistry('https://gcr.io',
													'gcr:xander-the-harris-jenkins') {
				stage('checkout') {
					checkout scm
				}
				stage('build') {
					agentImage = docker.build('gcr.io/xander-the-harris-jenkins/agent')
				}
				stage('push') {
					agentImage.push()
					agentImage.push(env.BUILD_NUMBER)
				}
			}
		}
	}
}
