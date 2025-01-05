pipeline{
    agent any
    environment {
        dockerhub_cred = credentials('dockerhub')
    }
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
                    sh "docker run -d -p 5000:5000 --name flask-app flask-app:lts"
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
        stage("push to dockerhub"){
            steps{
                script{
                    sh"docker tag flask-app:lts myt200507/my-mini-project"
                    sh"echo $dockerhub_cred_PSW | docker login -u $dockerhub_cred_USR --password-stdin"
                    sh"docker push myt200507/my-mini-project"
                }
            }
        }        
    }
    post{
        always{
            sh "docker stop flask-app"
            sh"docker rm flask-app"
        }
        success{
            echo "pipline completed successfully"
        }
        failure{
            echo "pipline failed"
        }
    }
}
