node {

    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
       app = docker.build("cw2-server")
    }

    stage('Test image') {
        app.inside {
            sh 'echo "Echo from within Container Sucsessful"'
        }
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker') {
            app.push("${env.BUILD_VERSION}")
            app.push("latest")
        }
    }
}
