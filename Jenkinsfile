def agentImage

node('worker') {
	stage('checkout') {
		checkout scm
	}
	stage('build') {
		agentImage = docker.build('gcr.io/xander-the-harris-jenkins/agent')
	}
	stage('push') {
		echo('push')
	}
}
