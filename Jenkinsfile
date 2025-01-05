pipeline {
    agent any
    tools {
        jdk 'JDK 11'    // The name you used for the JDK configuration
        maven 'Maven 3.8' // The name you used for Maven
    }
    stages {
        stage('Checkout') {
            steps {
                // Clone your repository and checkout a specific branch
                git branch: 'awsliftandshift', url: 'https://github.com/hkhcoder/vprofile-project.git'
            }
        }
        stage('Build') {
            steps {
                // Run Maven build
                sh 'mvn clean install'
            }
        }
        stage('Upload to S3') {
            steps {
                script {
                    // Ensure the artifact exists in the target folder
                    def artifactPath = 'target/vprofile-v2.war' // Adjust the path as per your artifact
                    def s3Bucket = 'jenkins-artifact-shalev'
                    def s3Path = ''  // Set the desired path in your S3 bucket

                    // Run AWS CLI command to upload the artifact to S3
                    sh """
                    aws s3 cp ${artifactPath} s3://${s3Bucket}/${s3Path}
                    """
                }
            }
        }
    }
    post {
        success {
            echo 'Build and upload to S3 successful!'
        }
        failure {
            echo 'Build or upload failed.'
        }
    }
}
