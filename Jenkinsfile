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
		echo('push')
	}
	stage('publish') {
		step([$class: 'GitHubIssueNotifier',
		      issueAppend: true,
		      issueLabel: 'jenkins',
		      issueTitle: '$JOB_NAME $BUILD_DISPLAY_NAME failed'])
	}
}
