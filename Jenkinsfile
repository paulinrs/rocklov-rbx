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
                sh 'cd backend && robot\tests'
            }
        }
        stage('Rum UI Tests') {
            steps{
                sh 'cd frontend && robot\tests'
            }
        } 
    }
}
