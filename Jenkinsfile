node {

    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
       app = docker.build("dockerfile")
    }

    stage('Test image') {
        app.inside {
            sh 'echo "Echo from within Container Sucsessful"'
        }
    }

    stage('Push image') {
        docker.withRegistry('https://hub.docker.com/repository/docker/chrissyboyo/cw2-server', 'docker') {
            app.push("${env.BUILD_VERSION}")
            app.push("latest")
        }
    }
}
