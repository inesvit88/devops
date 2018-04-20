pipeline {

    agent any

    environment { 
        NEW_VAR = "new variable"
        MS_JAR_STAGE = "/opt/projects/stage-microservices"
        MS_WAR_STAGE = "/opt/projects/bsro-builds/bsro-releases/b2o-ci-prod-ep/assets/microservices"
    }
/*
    tools { 
        maven 'Maven 3.3.9' 
        jdk 'jdk8' 
    }
*/

/* Assests */

    stages {
        stage('Stage 1: Build Microservices') {
            steps {

                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            	echo "Stage 1: Build Microservices..."
// build job: 'MS-DEV-JAR-WAR'

                git branch: 'DEV_MICROSERV_THAC', credentialsId: '3b46d48c-b231-4771-ac38-8dd56d10a1ea',
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'

// Build and copy JARs to stage dir

                sh '/usr/local/maven/apache-maven-3.3.9/bin/mvn -f $WORKSPACE/Micro_Services/pom.xml clean install -P jar'

                sh '[ \! -d $MS_JAR_STAGE ] && mkdir -p $MS_JAR_STAGE'
                sh 'find $WORKSPACE/Micro_Services/* -name "microservices-code-1.*.jar" -execdir /bin/cp {} $MS_JAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "alignment-1.*.jar" -execdir /bin/cp {} $MS_JAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "appt-1.*.jar" -execdir /bin/cp {} $MS_JAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "battery-1.*.jar" -execdir /bin/cp {} $MS_JAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "contact-1.*.jar" -execdir /bin/cp {} $MS_JAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "proxy-1.*.jar" -execdir /bin/cp {} $MS_JAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "promo-1.*.jar" -execdir /bin/cp {} $MS_JAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "stores-1.*.jar" -execdir /bin/cp {} $MS_JAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "tires-1.*.jar" -execdir /bin/cp {} $MS_JAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "vis-1.*.jar" -execdir /bin/cp {} $MS_JAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "ecomm-stores-1.*.jar" -execdir /bin/cp {} $MS_JAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "voice-0.*.jar" -execdir /bin/cp {} $MS_JAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "loginmicroservices-0.*.jar" -execdir /bin/cp {} $MS_JAR_STAGE \\;'

// Build and copy WARs to stage dir

                sh '/usr/local/maven/apache-maven-3.3.9/bin/mvn -f $WORKSPACE/Micro_Services/pom.xml clean install -P war'

                sh '[ \! -d $MS_WAR_STAGE ] && mkdir -p $MS_WAR_STAGE'
		sh 'find $WORKSPACE/Micro_Services/* -name "appt-1.*.war" -execdir /bin/cp {} $MS_WAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "battery-1.*.war" -execdir /bin/cp {} $MS_WAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "contact-1.*.war" -execdir /bin/cp {} $MS_WAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "proxy-1.*.war" -execdir /bin/cp {} $MS_WAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "promo-1.*.war" -execdir /bin/cp {} $MS_WAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "stores-1.*.war" -execdir /bin/cp {} $MS_WAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "tires-1.*.war" -execdir /bin/cp {} $MS_WAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "vis-1.*.war" -execdir /bin/cp {} $MS_WAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "alignment-1.*.war" -execdir /bin/cp {} $MS_WAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "ecomm-stores-1.*.war" -execdir /bin/cp {} $MS_WAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "voice-*.war" -execdir /bin/cp {} $MS_WAR_STAGE \\;'
		sh 'find $WORKSPACE/Micro_Services/* -name "login-*.war" -execdir /bin/cp {} $MS_WAR_STAGE \\;'
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
