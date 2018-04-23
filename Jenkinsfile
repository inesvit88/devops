pipeline {

    agent any

    environment { 

// !!! Update this variable on bsro-tools !!!
        MVN_HOME = "/usr/local/maven/apache-maven-3.3.9"

        MS_JAR_STAGE = "/opt/projects/stage-microservices"
        MS_WAR_STAGE = "/opt/projects/bsro-builds/bsro-releases/b2o-ci-prod-ep/assets/microservices"
        MICROSERV_BRANCH = "DEV_MICROSERV_THAC"
        ADMIN_BRANCH = "ADMIN_DEV"
	EC_BRANCH = "DEV_OSGI"
	OSGI_BRANCH = "DEV_OSGI"
	MODES_BRANCH = "DEV_OSGI"
	WORKFLOW_BRANCH = "DEV_OSGI"
	UI_BRANCH = "DEV_UI"
	TOOLS_BRANCH = "TOOLS-RELEASES-THAC" 
	GLOBAL_PKG_DESTINATION = "/mnt/apps/bsro/assets/content/global"
// Docker env variables

	DOCKER_IMAGE_NAME=b2o-ci-prod-ep
	DOCKER_CONTAINER_NAME=B2O_EP
    }
/*
    tools { 
        maven 'Maven 3.3.9' 
        jdk 'jdk8' 
    }
*/

/* Assests */

    stages {
        stage('Stage 1 (MS-DEV-JAR-WAR): Build Microservices') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            	echo "Stage 1: Build Microservices..."

                git branch: env.MICROSERV_BRANCH, credentialsId: '3b46d48c-b231-4771-ac38-8dd56d10a1ea',
                     url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'

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
            }
        }
        stage('Stage 2 (BSRO-ADMIN): Build BSRO Admin WebApp') {
            steps {
	    	echo 'Stage 2: Build BSRO Admin WebApp'

// Cleanup workspace
		deleteDir()
		
                git branch: env.ADMIN_BRANCH, credentialsId: '3b46d48c-b231-4771-ac38-8dd56d10a1ea',
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro-admin.git'

		sh '$MVN_HOME/bin/mvn -f $WORKSPACE/BSROAdmin/pom.xml clean install'

		sh 'find $WORKSPACE/BSROAdmin/target/* -name "BSROAdmin*.war" -execdir /bin/cp {} $MS_WAR_STAGE \\;'
            }
        }
        stage('Stage 3 (PACKAGE_AND_COPY_ALL_GLOBAL_PACKAGES): Package and copy all global packages') {
            steps {
                echo 'Stage 3: Package and copy all global packages'

		sh '[ -d $GLOBAL_PKG_DESTINATION ] || mkdir -p $GLOBAL_PKG_DESTINATION'
// Build EC
// Cleanup workspace
                deleteDir()
                git branch: env.EC_BRANCH, credentialsId: '3b46d48c-b231-4771-ac38-8dd56d10a1ea',
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'
		sh '$MVN_HOME/bin/mvn -f $WORKSPACE/AEM_Components/pom.xml clean package  -P ec'
                sh 'cp $WORKSPACE/AEM_Components/bsro-aem-ui/bsro-ec/target/bsro-ec-*.zip $GLOBAL_PKG_DESTINATION'
// Build Modes
// Cleanup workspace
                deleteDir()
                git branch: env.MODES_BRANCH, credentialsId: '3b46d48c-b231-4771-ac38-8dd56d10a1ea',
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'
  		sh '$MVN_HOME/bin/mvn -f $WORKSPACE/AEM_Components/pom.xml clean package  -P modes'
                sh 'cp $WORKSPACE/AEM_Components/bsro-aem-ui/bsro-modes/target/bsro-modes-*.zip $GLOBAL_PKG_DESTINATION'
  
// Build Workflow 
// Cleanup workspace
                deleteDir()
                git branch: env.WORKFLOW_BRANCH, credentialsId: '3b46d48c-b231-4771-ac38-8dd56d10a1ea',
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'
   		sh '$MVN_HOME/bin/mvn -f $WORKSPACE/AEM_Components/pom.xml clean package -P workflow'
   		sh 'cp $WORKSPACE/AEM_Components/bsro-aem-ui/bsro-workflow/target/bsro-workflow-*.zip $GLOBAL_PKG_DESTINATION'
    
// Build OSGi
// Cleanup workspace
                deleteDir()
                git branch: env.OSGI_BRANCH, credentialsId: '3b46d48c-b231-4771-ac38-8dd56d10a1ea',
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'
        	sh '$MVN_HOME/bin/mvn -f $WORKSPACE/AEM_Components/pom.xml clean package   -P osgi'
        	sh 'cp $WORKSPACE/AEM_Components/bsro-aem-ui/bsro-osgi/target/bsro-osgi-*.zip $GLOBAL_PKG_DESTINATION'
            }
        }
        stage('Stage 4 (BUILD_GLOBAL_UI): Build global UI') {
            steps {
		echo 'Stage 4: Build global UI'
// Build global UI
// Cleanup workspace
               	deleteDir()
               	git branch: env.UI_BRANCH, credentialsId: '3b46d48c-b231-4771-ac38-8dd56d10a1ea',
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'
               	sh '$MVN_HOME/bin/mvn -f $WORKSPACE/AEM_Components/pom.xml clean package   -P ui'
		sh 'cp $WORKSPACE/AEM_Components/bsro-aem-ui/target/bsro-ui-*.zip $GLOBAL_PKG_DESTINATION'
            }
        }

/* Image build and initiation */

        stage('Stage 5 (B2O-EP-IMAGE): Build docker image: B2O-EP-IMAGE') {
            steps {
                echo 'Stage 5: Build docker image: B2O-EP-IMAGE'
// Build docker image: B2O-EP-IMAG
// Cleanup workspace
                deleteDir()
                git branch: env.TOOLS_BRANCH, credentialsId: '3b46d48c-b231-4771-ac38-8dd56d10a1ea',
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro-releases.git'
		sh '''
		  cd $WORKSPACE/b2o-ci-prod-ep
		  docker build --tag="$IMAGE_NAME" .
		  
		  CONTAINER_ID=`docker run --name $DOCKER_CONTAINER_NAME -i -d -p 4502-4503:4502-4503 -p 8080:8080 -p 81:80 -p 71:71 --add-host shop-bsro-fcac-pr.firestonecompleteautocare.com:63.137.180.2 $DOCKER_IMAGE_NAME`
		  sleep 60

		'''
            }
        }

/* Beaming content -- RUN IN PARALLEL */

        stage('Stage 6 (PARALLEL RUN for BEAM_ALL_REBUILT_PACKAGES-V1-4502 && BEAM_ALL_REBUILT_PACKAGES-V1-4503): Beaming the content for AUTH and PUB') {
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

        stage('Stage 7 (CONTENT_HOTFIX): Install HotFix package') {
            steps {
                echo 'Stage 7: Install HotFix package'
            }
        }

/* Compact and copy */

        stage('Stage 8 (COMPACT_REPO && COPY_REPO): Compact and copy repo') {
            steps {
                echo 'Stage 8: Compact and copy repo'
            }
        }

/* Build BSRO volumes */

        stage('Stage 9 (BUILD-BSRO-AUTHOR-VOLUME && BUILD-BSRO-PUBLISH-VOLUME): Build BSRO docker volumes (4 volumes)') {
            steps {
                echo 'Stage 9: Build BSRO docker volumes for AUTH and PUB (4 volumes)'
            }
        }

/* Build docker master image */

        stage('Stage 10 (B2O-MS-IMAGE): Build docker master image: B2O-MS-IMAGE') {
            steps {
                echo 'Stage 10: Build docker master image: B2O-MS-IMAGE'
            }
        }
    }
    post {
        always {
            echo 'One way or another, I have finished'
// Cleanup workspace
//            deleteDir() 

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
