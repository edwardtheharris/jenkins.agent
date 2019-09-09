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
			docker.withServer('tcp://worker.jenkins.brick-house.org:2376', 
												'worker.jenkins.brick-house.org') {
				agentImage = docker.build('gcr.io/xander-the-harris-jenkins/agent')
			}
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
