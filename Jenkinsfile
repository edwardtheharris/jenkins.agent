def agentImage
properties([[
	$class: 'GithubProjectProperty',
	projectUrlStr: 'https://github.com/edwardtheharris/jenkins.agent'
]])

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
			docker.withRegistry('gcr.io/xander-the-harris-jenkins')	{
				agentImage.push()
				agentImage.push(env.BUILD_NUMBER)
			}
		}
	}
	stage('publish') {
		if (currentBuild.currentResult == 'FAILURE') {
			step([$class: 'GitHubIssueNotifier',
			      issueAppend: true,
			      issueLabel: 'jenkins',
			      issueTitle: '$JOB_NAME $BUILD_DISPLAY_NAME failed'])	
		}
	}
}
