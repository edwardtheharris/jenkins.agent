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
												 passwordVariable: '',
												 usernameVariable: '')
			]) {
				sh($/
					gcloud auth activate service-account --key-file /home/duchess/xander-the-harris-jenkins.json
					gcloud auth configure docker
				/$)
				agentImage.push()
				agentImage.push(env.BUILD_NUMBER)
			}
		}
	}
}
