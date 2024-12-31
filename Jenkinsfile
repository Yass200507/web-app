pipeline{
    agent any
    stages{
        stage("build docker image"){
            steps{
                script{
                    sh "docker build -t flask-app:lts ."
                }
            }
        }
        stage("run docker image"){
            steps{
                script{
                    sh "docker run -d -p 5000:5000 flask-app:lts"
                }
            }
        }
        stage("test docker image"){
            steps{
                script{
                    sh "docker ps"
                }
            }
        }        
    }
    post{
        success{
            echo "pipline completed successfully"
        }
        failure{
            echo "pipline failed"
        }
    }
}
