pipeline {
    agent {label 'docker'}

    stages {
        stage('Gitcheckout') {
            steps {
                git branch: 'main', url: 'https://github.com/chaitanya-0799/simple-python.git'
            }
        }
        stage('Docker Build'){
            steps {
                sh 'docker build -t ckdh0799/jenkins-py:${BUILD_NUMBER} /home/ubuntu/simple-python-app/'
            }
        }
        stage('Docker Push'){
            steps {
                sh 'docker push ckdh0799/jenkins-py:${BUILD_NUMBER}'
            }
        }
        stage ('Docker Deploy'){
            steps {
                sh 'docker stop python || true'
                sh 'docker rm python || true'
                sh 'docker run -itd -p 80:5000 --name python ckdh0799/jenkins-py:${BUILD_NUMBER}'
            }
        }
    }
}
