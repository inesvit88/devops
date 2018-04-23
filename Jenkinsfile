pipeline {

    agent any

    environment { 

// !!! Update this variable on bsro-tools !!!
        MVN_HOME = "/usr/local/maven/apache-maven-3.3.9"

        MS_JAR_STAGE = "/opt/projects/stage-microservices"
        MS_WAR_STAGE = "/opt/projects/bsro-builds/bsro-releases/b2o-ci-prod-ep/assets/microservices"
        MS_BRANCH = "DEV_MICROSERV_THAC"
        ADMIN_BRANCH = "ADMIN_DEV"
	EC_BRANCH = "DEV_OSGI"
	OSGI_BRANCH = "DEV_OSGI"
	MODES_BRANCH = "DEV_OSGI"
	WORKFLOW_BRANCH = "DEV_OSGI"
	STAGE3_DESTINATION = "/mnt/apps/bsro/assets/content/global"
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
                withEnv(['WORKSPACE=$WORKSPACE/bsro']) {
	                git branch: '$MS_BRANCH', credentialsId: '3b46d48c-b231-4771-ac38-8dd56d10a1ea',
       	                     url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'
		}
/*

// Build and copy JARs to stage dir

                sh '$MVN_HOME/bin/mvn -f $WORKSPACE/Micro_Services/pom.xml clean install -P jar'

                sh '[ -d $MS_JAR_STAGE ] || mkdir -p $MS_JAR_STAGE'
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

                sh '$MVN_HOME/bin/mvn -f $WORKSPACE/Micro_Services/pom.xml clean install -P war'

                sh '[ -d $MS_WAR_STAGE ] || mkdir -p $MS_WAR_STAGE'
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
*/
            }
        }
        stage('Stage 2: Build BSRO Admin WebApp') {
            steps {
	    	echo 'Stage 2: Build BSRO Admin WebApp'
                git branch: '$ADMIN_BRANCH', credentialsId: '3b46d48c-b231-4771-ac38-8dd56d10a1ea',
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro-admin.git'

		sh '$MVN_HOME/bin/mvn -f $WORKSPACE/BSROAdmin/pom.xml clean install'

		sh 'find $WORKSPACE/BSROAdmin/target/* -name "BSROAdmin*.war" -execdir /bin/cp {} $MS_WAR_STAGE \\;'
            }
        }
        stage('Stage 3: Package and copy all global packages') {
            steps {
                echo 'Stage 3: Package and copy all global packages'

		sh '[ -d $STAGE3_DESTINATION ] || mkdir -p $STAGE3_DESTINATION'
// Build EC
                git branch: '$EC_BRANCH', credentialsId: '3b46d48c-b231-4771-ac38-8dd56d10a1ea',
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'
		sh '$MVN_HOME/bin/mvn -f $WORKSPACE/bsro/AEM_Components/pom.xml clean package  -P ec'
                sh 'cp $WORKSPACE/bsro/AEM_Components/bsro-aem-ui/bsro-ec/target/bsro-ec-*.zip $STAGE3_DESTINATION'
// Build Modes
                git branch: '$MODES_BRANCH', credentialsId: '3b46d48c-b231-4771-ac38-8dd56d10a1ea',
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'
  		sh '$MVN_HOME/bin/mvn -f $WORKSPACE/bsro/AEM_Components/pom.xml clean package  -P modes'
                sh 'cp $WORKSPACE/bsro/AEM_Components/bsro-aem-ui/bsro-modes/target/bsro-modes-*.zip $STAGE3_DESTINATION'
  
// Build Workflow 
                git branch: '$WORKFLOW_BRANCH', credentialsId: '3b46d48c-b231-4771-ac38-8dd56d10a1ea',
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'
   		sh '$MVN_HOME/bin/mvn -f $WORKSPACE/bsro/AEM_Components/pom.xml clean package -P workflow'
   		sh 'cp $WORKSPACE/bsro/AEM_Components/bsro-aem-ui/bsro-workflow/target/bsro-workflow-*.zip $STAGE3_DESTINATION'
    
// Build OSGi
                git branch: '$OSGI_BRANCH', credentialsId: '3b46d48c-b231-4771-ac38-8dd56d10a1ea',
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'
        	sh '$MVN_HOME/bin/mvn -f $WORKSPACE/bsro/AEM_Components/pom.xml clean package   -P osgi'
        	sh 'cp $WORKSPACE/bsro/AEM_Components/bsro-aem-ui/bsro-osgi/target/bsro-osgi-*.zip $STAGE3_DESTINATION'
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

        stage('Stage 6 (PARALLEL RUN): Beaming the content for AUTH and PUB') {
            steps {
		parallel(
        	  author: {
	                echo 'Stage 6: Beaming the content for AUTHOR'
		  },
		  publish: {
	                echo 'Stage 6: Beaming the content for PUBLISH'
		  }
		)
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
    post {
        always {
            echo 'One way or another, I have finished'
            deleteDir() /* clean up our workspace */
        }
        success {
            echo 'I succeeeded!'
        }
        unstable {
            echo 'I am unstable :/'
        }
        failure {
            echo 'I failed :('
        }
        changed {
            echo 'Things were different before...'
        }
    }
}
