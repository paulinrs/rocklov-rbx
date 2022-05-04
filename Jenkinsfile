pipeline {
    agent{
       docker  {image 'python'}
    }

    stages {
        stage('Preparation') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Rum API Tests') {
            steps {
                sh 'cd backand && robot - d/logs tests'
            }
        }
        stage('Rum UI Tests') {
            steps{
                sh 'cd backand && robot -d ./logs tests'
            }
        } 
    }
}
