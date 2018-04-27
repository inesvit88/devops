pipeline {

    agent any

    environment { 

// !!! Update these variables on bsro-tools Jenkins!!!
        MVN_HOME="/usr/local/maven/apache-maven-3.3.9"
	AEM_ADMIN_CREDS="5b82df01-8095-4fad-9fa0-7e0621537e72"
	GIT_CREDS="3b46d48c-b231-4771-ac38-8dd56d10a1ea"

        MS_JAR_STAGE="/opt/projects/stage-microservices"
        MS_WAR_STAGE="/opt/projects/bsro-builds/bsro-releases/b2o-ci-prod-ep/assets/microservices"
	AUTOMATION_STAGE="/opt/projects/bsro/automation"
        MICROSERV_BRANCH="DEV_MICROSERV_THAC"
        ADMIN_BRANCH="ADMIN_DEV"
	EC_BRANCH="DEV_OSGI"
	OSGI_BRANCH="DEV_OSGI"
	MODES_BRANCH="DEV_OSGI"
	WORKFLOW_BRANCH="DEV_OSGI"
	UI_BRANCH="DEV_UI"
	TOOLS_BRANCH="TOOLS-RELEASES-THAC" 
	GLOBAL_PKG_DESTINATION="/mnt/apps/bsro/assets/content/global"
	DOCKER_IMAGE_NAME="b2o-ci-prod-ep"
	DOCKER_CONTAINER_NAME="B2O_EP"
	DOCKER_AUTHOR_VOLUME_DIR="/mnt/data2/dockervolume/workspace"
        DOCKER_PIUBLISH_VOLUME_DIR="/mnt/data3/dockervolume/workspace"
	HOST="bsro-tools.icrossing.com"
	A_PORT="14502"
	P_PORT="14503"
// UI_HOTFIX_V1 variable
	LAST_COMMIT="11251bdc2"
	DATE="20180502"
// CONTENT_HOTFIX variables
	CONTENT_HOTFIX_VERSION="1.1.14_20180502"
	CONTENT_HOTFIX_PKGNAME="bsro-content-hotfix-$CONTENT_HOTFIX_VERSION"



    }
/*
    tools { 
        maven 'Maven 3.3.9' 
        jdk 'jdk8' 
    }
*/

/* Assests */

    stages {
/* ***********************************************
        stage('Stage 1 (MS-DEV-JAR-WAR): Build Microservices') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            	echo "Stage 1: Build Microservices..."

                git branch: env.MICROSERV_BRANCH, credentialsId: env.GIT_CREDS,
                     url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'

// !!! ----- TO BE DELETED ----- Build and copy JARs to stage dir

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
		
                git branch: env.ADMIN_BRANCH, credentialsId: env.GIT_CREDS,
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
                git branch: env.EC_BRANCH, credentialsId: env.GIT_CREDS,
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'
		sh '$MVN_HOME/bin/mvn -f $WORKSPACE/AEM_Components/pom.xml clean package  -P ec'
                sh 'cp $WORKSPACE/AEM_Components/bsro-aem-ui/bsro-ec/target/bsro-ec-*.zip $GLOBAL_PKG_DESTINATION'
// Build Modes
// Cleanup workspace
                deleteDir()
                git branch: env.MODES_BRANCH, credentialsId: env.GIT_CREDS,
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'
  		sh '$MVN_HOME/bin/mvn -f $WORKSPACE/AEM_Components/pom.xml clean package  -P modes'
                sh 'cp $WORKSPACE/AEM_Components/bsro-aem-ui/bsro-modes/target/bsro-modes-*.zip $GLOBAL_PKG_DESTINATION'
  
// Build Workflow 
// Cleanup workspace
                deleteDir()
                git branch: env.WORKFLOW_BRANCH, credentialsId: env.GIT_CREDS,
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'
   		sh '$MVN_HOME/bin/mvn -f $WORKSPACE/AEM_Components/pom.xml clean package -P workflow'
   		sh 'cp $WORKSPACE/AEM_Components/bsro-aem-ui/bsro-workflow/target/bsro-workflow-*.zip $GLOBAL_PKG_DESTINATION'
    
// Build OSGi
// Cleanup workspace
                deleteDir()
                git branch: env.OSGI_BRANCH, credentialsId: env.GIT_CREDS,
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
               	git branch: env.UI_BRANCH, credentialsId: env.GIT_CREDS,
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'
               	sh '$MVN_HOME/bin/mvn -f $WORKSPACE/AEM_Components/pom.xml clean package   -P ui'
		sh 'cp $WORKSPACE/AEM_Components/bsro-aem-ui/target/bsro-ui-*.zip $GLOBAL_PKG_DESTINATION'
            }
        }

// Image build and initiation

        stage('Stage 5 (B2O-EP-IMAGE): Build docker image: B2O-EP-IMAGE') {
            steps {
                echo 'Stage 5: Build docker image: B2O-EP-IMAGE'
// Build docker image: B2O-EP-IMAG
// Cleanup workspace
                deleteDir()
                git branch: env.TOOLS_BRANCH, credentialsId: env.GIT_CREDS,
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro-releases.git'
		sh '''
		  
		  set +x
// Stage automation scripts for later use
		  [ -d $AUTOMATION_STAGE ] || mkdir -p $AUTOMATION_STAGE
		  cp $WORKSPACE/automation/* $AUTOMATION_STAGE

		  cp -r $MS_WAR_STAGE $WORKSPACE/b2o-ci-prod-ep/assets/
		  cd $WORKSPACE/b2o-ci-prod-ep
		  docker build --tag="$DOCKER_IMAGE_NAME" -f Dockerfile.local .
		  
		  CONTAINER_ID=`docker run --name $DOCKER_CONTAINER_NAME -i -d -p 4502-4503:4502-4503 -p 8080:8080 -p 81:80 -p 71:71 --add-host shop-bsro-fcac-pr.firestonecompleteautocare.com:63.137.180.2 $DOCKER_IMAGE_NAME`
		  sleep 30

		'''

            }
        }

// Beaming content -- RUN IN PARALLEL 

        stage('Stage 6 (PARALLEL RUN for BEAM_ALL_REBUILT_PACKAGES-V1-4502 && BEAM_ALL_REBUILT_PACKAGES-V1-4503): Beaming the content for AUTH and PUB') {
            steps {
		parallel(
        	  author: {
	                echo 'Stage 6: Beaming the content for AUTHOR'

			withCredentials([usernameColonPassword(credentialsId: env.AEM_ADMIN_CREDS, variable: 'USERPASS')]) {
    			  sh '''

			  set +x
			  ls -al $AUTOMATION_STAGE/beam_packages_author_v2.sh

    			  '''
			}
		  },
		  publish: {
	                echo 'Stage 6: Beaming the content for PUBLISH'
                        withCredentials([usernameColonPassword(credentialsId: env.AEM_ADMIN_CREDS, variable: 'USERPASS')]) {
                          sh '''

                          set +x
                          ls -al $AUTOMATION_STAGE/beam_packages_publish_v2.sh

                          '''
                        }
		  }
		)
            }
        }
****************************/

/* Hotfix package install */

        stage('Stage 7 (UI_HOTFIX_V1-->CONTENT_HOTFIX): Install HotFix package') {
            steps {
                echo 'Stage 7: Install HotFix package'
// === UI_HOTFIX_V1
// Script #1: Implemented as Part of Stage 4 & 5 to build and beam bsro-aem-ui-${version}.zip 

// Script #2:

/*************************** 

// Cleanup workspace
                deleteDir()
                git branch: env.UI_BRANCH, credentialsId: env.GIT_CREDS,
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'

		sh '''
		  mkdir $WORKSPACE/hotfix
    		  git archive --output=hotfix/hotfix.zip HEAD $(git fetch && git diff --name-only --diff-filter=d $LAST_COMMIT HEAD | grep -v 'sem/'  | grep -v '/content/bsro/' | grep -v 'fonts/')
    		  cd hotfix
    		  unzip hotfix.zip
    		  cp $WORKSPACE/AEM_Components/pom.xml $WORKSPACE/hotfix/AEM_Components
		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/pom-hotfix.xml $WORKSPACE/hotfix/AEM_Components/bsro-aem-ui

    		  HOTFIX_DIR=$WORKSPACE/hotfix/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/voice-fcac/clientlib
		  mkdir -p $HOTFIX_DIR/css
		  mkdir -p $HOTFIX_DIR/js
    		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/voice-fcac/clientlib/js/main.js $HOTFIX_DIR/js/main.js
		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/voice-fcac/clientlib/css/main.css $HOTFIX_DIR/css/main.css
		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/voice-fcac/clientlib/*.txt $HOTFIX_DIR 
    
    
		  HOTFIX_DIR=$WORKSPACE/hotfix/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/fcac/clientlib
              	  mkdir -p $HOTFIX_DIR/css
		  mkdir -p $HOTFIX_DIR/js
    
		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/fcac/clientlib/*.txt $HOTFIX_DIR
		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/fcac/clientlib/css/main.css $HOTFIX_DIR/css/main.css
		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/fcac/clientlib/js/main.js $HOTFIX_DIR/js/main.js
    
		  HOTFIX_DIR=$WORKSPACE/hotfix/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/hibdontire/clientlib
		  mkdir -p $HOTFIX_DIR/css
		  mkdir -p $HOTFIX_DIR/js
    
		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/hibdontire/clientlib/*.txt $HOTFIX_DIR
		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/hibdontire/clientlib/js/main.js $HOTFIX_DIR/js/main.js
		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/hibdontire/clientlib/css/main.css $HOTFIX_DIR/css/main.css
    
		  HOTFIX_DIR=$WORKSPACE/hotfix/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/tiresplus/clientlib
		  mkdir -p $HOTFIX_DIR/css
		  mkdir -p $HOTFIX_DIR/js

		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/tiresplus/clientlib/*.txt $HOTFIX_DIR
		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/tiresplus/clientlib/js/main.js $HOTFIX_DIR/js/main.js
		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/tiresplus/clientlib/css/main.css $HOTFIX_DIR/css/main.css
    
		  HOTFIX_DIR=$WORKSPACE/hotfix/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/wheelworks/clientlib
		  mkdir -p $HOTFIX_DIR/css
		  mkdir -p $HOTFIX_DIR/js

		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/wheelworks/clientlib/*.txt $HOTFIX_DIR
		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/wheelworks/clientlib/js/main.js $HOTFIX_DIR/js/main.js
		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/wheelworks/clientlib/css/main.css $HOTFIX_DIR/css/main.css
    
		  HOTFIX_DIR=$WORKSPACE/hotfix/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/bsro/clientlib
		  mkdir -p $HOTFIX_DIR/css
		  mkdir -p $HOTFIX_DIR/js
		  cp -R $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/bsro/* $WORKSPACE/hotfix/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/bsro
    
		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/bsro/clientlib/*.txt $HOTFIX_DIR
		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/bsro/clientlib/js/base.js $HOTFIX_DIR/js/base.js
		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/bsro/clientlib/css/global.css $HOTFIX_DIR/css/global.css
		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/bsro/clientlib/css/retrofit.css $HOTFIX_DIR/css/retrofit.css
		  cp $WORKSPACE/AEM_Components/bsro-aem-ui/src/main/content/jcr_root/etc/designs/bsro/bsro/clientlib/css/styles.css $HOTFIX_DIR/css/styles.css
		'''
// Script #3: Sync up the content with Author

		withCredentials([usernameColonPassword(credentialsId: env.AEM_ADMIN_CREDS, variable: 'USERPASS')]) {
			sh '''

			  JCR_ROOT=$WORKSPACE/hotfix/AEM_Components/bsro-aem-ui/src/main/content/jcr_root
			  aemsync -t http://$USERPASS@$HOST:$A_PORT -w $JCR_ROOT &
			  sleep 30
			  kill $(ps -aux | grep "[a]emsync" | awk '{print $2}')

			'''
		}
// Script #4:
		sh '''
		  cd $WORKSPACE/hotfix

		  find . -type f -name ".content.xml" -print -exec touch '{}' +

		  groovy $AUTOMATION_STAGE/workspaceFilter.groovy
		  mkdir -p ./AEM_Components/bsro-aem-ui/src/main/content/META-INF/vault
		  cp filterUi.xml ./AEM_Components/bsro-aem-ui/src/main/content/META-INF/vault/filterUiHotfix.xml
		'''
		withCredentials([usernamePassword(credentialsId: env.AEM_ADMIN_CREDS, usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                        sh '''
			  USERPASS="$USER:$PASS"
			  $MVN_HOME/bin/mvn -f $WORKSPACE/hotfix/AEM_Components/bsro-aem-ui/pom-hotfix.xml clean package install -DDATE=$DATE -Dcq.host=$HOST -Dcq.port=$A_PORT -Dcq.password=$PASS -P ui-hotfix
			  $MVN_HOME/bin/mvn content-package:build -f $WORKSPACE/hotfix/AEM_Components/bsro-aem-ui/pom-hotfix.xml -DDATE=$DATE -Dcq.host=$HOST -Dcq.port=$A_PORT -Dcq.password=$PASS -P ui-hotfix-build
 		  	  HOTFIX_FILE=`find . -type f -name "bsro-ui-hotfix*.zip" | grep target`
			  # Install package on publisher
			  curl -u $USERPASS $HOST:$P_PORT/crx/packmgr/service.jsp -F file=@"$HOTFIX_FILE" -F name="bsro-aem-ui-hotfix" -F force=true -F install=true  
			'''
		}
// =========================== CONTENT_HOTFIX =====================
// Cleanup WORKSPACE
		deleteDir()
                git branch: env.UI_BRANCH, credentialsId: env.GIT_CREDS,
                             url: 'https://inesvit@git.icrossing.net/web-development/bsro.git'


		withCredentials([usernameColonPassword(credentialsId: env.GIT_CREDS, variable: 'USERPASS')]) {
			sh '''
			  git fetch --tags https://${USERPASS}@git.icrossing.net/web-development/bsro.git
                          git diff --name-only --diff-filter=d $LAST_COMMIT HEAD | grep "content/bsro/" | sed "s/AEM_Components\\/bsro-aem-ui\\/src\\/main\\/content\\/jcr_root//g" | sed "s/\\/.content\\.xml//g" > filter.txt
			'''

    		}

		withCredentials([usernameColonPassword(credentialsId: env.AEM_ADMIN_CREDS, variable: 'USERPASS')]) {

			sh '''
			  set +x
			  cd $WORKSPACE
		  	  #git fetch && git diff --name-only --diff-filter=d $LAST_COMMIT HEAD | grep "content/bsro/" | sed "s/AEM_Components\\/bsro-aem-ui\\/src\\/main\\/content\\/jcr_root//g" | sed "s/\\/.content\\.xml//g" > filter.txt

			  if [ -s filter.txt ]
		    	    then
			    # Create a package
  			    curl -u $USERPASS -X POST http://$HOST:$A_PORT/crx/packmgr/service/.json/etc/packages/bsro_hotfix/$CONTENT_HOTFIX_PKGNAME?cmd=create -d packageName=$CONTENT_HOTFIX_PKGNAME-d groupName=bsro_hotfix
  
			    # Update Package
			    FJSON="[\"
			      while read line
  				do
				FJSON=$FJSON"{'root':'$line', 'rules':[{'modifier':'include', 'pattern':'$line(\\.*)'}]},"
				done < filter.txt
			    FJSON=$FJSON"]"
  
  			    curl -u $USERPASS -X POST http://$HOST:$A_PORT/crx/packmgr/update.jsp \
							    -F path=/etc/packages/bsro_hotfix/$CONTENT_HOTFIX_PKGNAME -F packageName=$CONTENT_HOTFIX_PKGNAME \
							    -F groupName=bsro_hotfix \
							    -F filter=@output.txt \
							    -F _charset_=UTF-

			    # Build Package
			    curl -u $USERPASS -X POST http://$HOST:$A_PORT/crx/packmgr/service/.json/etc/packages/bsro_hotfix/$CONTENT_HOTFIX_PKGNAME.zip?cmd=build
  
			    # Download Package
			    curl -u $USERPASS http://$HOST:$A_PORT/crx/packmgr/download.jsp?path=/etc/packages/bsro_hotfix/$CONTENT_HOTFIX_PKGNAME.zip > $CONTENT_HOTFIX_PKGNAME.zip
  
			    # Upload & Install package to publish
			    curl -u $USERPASS -F file=@"CONTENT_HOTFIX_PKGNAME.zip" -F name="bsro_hotfix" -F force=true -F install=true http://$HOST:P_PORT/crx/packmgr/service.jsp
			  else
  			    echo "Filter file is empty, No content update for now !!!"
			  fi
			'''
		}

            }
        }

***************************************/
/* Compact and copy */

        stage('Stage 8 (COMPACT_REPO && COPY_REPO): Compact and copy repo') {
            steps {
                echo 'Stage 8: Compact and copy repo'
		sh '''
		  echo "Compacting author repository..."
		  docker exec -i $DOCKER_CONTAINER_NAME /opt/aem/help/compact_v1.sh /opt/aem author

		  echo "Compacting publish repository..."
		  docker exec -i $DOCKER_CONTAINER_NAME /opt/aem/help/compact_v1.sh /opt/aem publish

		  echo "Copying author launchpad..."

		  # Remove existing author launchpad and reposotory folders, if any
		  rm -rf $DOCKER_AUTHOR_VOLUME_DIR/author/*

		  docker cp $DOCKER_CONTAINER_NAME:/opt/aem/author/crx-quickstart/launchpad $DOCKER_AUTHOR_VOLUME_DIR/author/launchpad
		  echo "Copying author repository..."
		  docker cp $DOCKER_CONTAINER_NAME:/opt/aem/author/crx-quickstart/repository $DOCKER_AUTHOR_VOLUME_DIR/author/repository

		  # Remove existing publish launchpad and reposotory folders, if any
		  rm -rf $DOCKER_PUBLISH_VOLUME_DIR/publish/*

		  echo "Copying publish launchpad..."
		  docker cp $DOCKER_CONTAINER_NAME:/opt/aem/publish/crx-quickstart/launchpad $DOCKER_PUBLISH_VOLUME_DIR/publish/launchpad

		  echo "Copying publish repository..."
		  docker cp $DOCKER_CONTAINER_NAME:/opt/aem/publish/crx-quickstart/repository $DOCKER_PUBLISH_VOLUME_DIR/publish/repository

		'''
            }
        }

/* Build BSRO volumes */

        stage('Stage 9 (BUILD-BSRO-AUTHOR-VOLUME && BUILD-BSRO-PUBLISH-VOLUME): Build BSRO docker volumes (4 volumes)') {
            steps {
                echo 'Stage 9: Build BSRO docker volumes for AUTH and PUB (4 volumes)'
		sh '''
		  cd $DOCKER_AUTHOR_VOLUME_DIR
		  echo "Building author volume image..."
		  docker build --tag="bsro-ci-prod-arepo-ms" -f Dockerfile.author .

		  cd $DOCKER_PUBLISH_VOLUME_DIR
                  echo "Building publish volume image..."
                  docker build --tag="bsro-ci-prod-prepo-ms" -f Dockerfile.publish .
		'''
            }
        }

/* Build docker master image */

        stage('Stage 10 (B2O-MS-IMAGE): Build docker master image: B2O-MS-IMAGE') {
            steps {
                echo 'Stage 10: Build docker master image: B2O-MS-IMAGE'

		sh '''
		  echo "Indexing and deleting launchpad/repository from AUTHOR and PUBLISH";
		  docker exec -i $DOCKER_CONTAINER_NAME /opt/aem/prep-ms.sh /opt/aem author
		  docker exec -i $DOCKER_CONTAINER_NAME /opt/aem/prep-ms.sh /opt/aem publish

		  echo "Exporting container to TAR format"
		  EXPORT_TAR_DIR="/mnt/data2/dockervolume/workspace"

		  #Remove any existing export tar files
		  rm -rf $EXPORT_TAR_DIR/b2o-ci-prod-master-ms.tar

		  docker export -o $EXPORT_TAR_DIR/b2o-ci-prod-master-ms.tar $DOCKER_CONTAINER_NAME

		  echo "Importing image (TAR) to local repo --begin"

		  cat $EXPORT_DIR/b2o-ci-prod-master-ms.tar | docker import -  b2o-ci-prod-master-ms:latest

		  docker stop $DOCKER_CONTAINER_NAME
		  docker rm -f $DOCKER_CONTAINER_NAME
		'''
            }
        }
    }
    post {
        always {
            echo 'Pipeline finished'
// Cleanup workspace
//            deleteDir() 

        }
        success {
            echo 'Succeeeded!'
        }
        unstable {
            echo 'Unstable :/'
        }
        failure {
            echo 'Failed :('
        }
        changed {
            echo 'Changes were made to the pipeline...'
        }
    }
}
