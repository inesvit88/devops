pipeline {



    agent any

    environment { 
        NEW_VAR = 'new variable'
    }

/* Assests */

    stages {
        stage('Stage 1: Build Microservices') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            	echo 'Stage 1: Build Microservices...'
//               build job: 'some-downtream-job-name'

                git branch: 'DEV_MICROSERV_THAC', credentialsId: '3b46d48c-b231-4771-ac38-8dd56d10a1ea',
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'


            }
        }
        stage('Stage 2: Build BSRO Admin WebApp') {
            steps {
	    	echo 'Stage 2: Build BSRO Admin WebApp'
            }
        }
        stage('Stage 3: Package and copy all global packages') {
            steps {
                echo 'Stage 3: Package and copy all global packages'
            }
        }
        stage('Stage 4: Build global UI') {
            steps {
                echo 'Stage 4: Build global UI'
            }
        }

/* Image build and initiation */

        stage('Stage 5: Build docker image: B2O-EP-IMAGE') {
            steps {
                echo 'Stage 5: Build docker image: B2O-EP-IMAGE'
            }
        }

/* Beaming content -- RUN IN PARALLEL */

        stage('Stage 6: Beaming the content for AUTH and PUB') {
            steps {
                echo 'Stage 6: Beaming the content for AUTHOR'
                echo 'Stage 6: Beaming the content for PUBLISH'
            }
        }

/* Hotfix package install */

        stage('Stage 7: Install HotFix package') {
            steps {
                echo 'Stage 7: Install HotFix package'
            }
        }

/* Compact and copy */

        stage('Stage 8: Compact and copy repo') {
            steps {
                echo 'Stage 8: Compact and copy repo'
            }
        }

/* Build BSRO volumes */

        stage('Stage 9: Build BSRO docker volumes (4 volumes)') {
            steps {
                echo 'Stage 9: Build BSRO docker volumes for AUTH and PUB (4 volumes)'
            }
        }

/* Build docker master image */

        stage('Stage 10: Build docker master image: B2O-MS-IMAGE') {
            steps {
                echo 'Stage 10: Build docker master image: B2O-MS-IMAGE'
            }
        }
    }
}
