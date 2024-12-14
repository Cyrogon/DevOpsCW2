node {

    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
       app = docker.build("chrissyboyo/cw2-server")
    }

    stage('Test image') {
        app.inside {
            sh 'echo "Running from within Docker container"'
        }
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker') {
            app.push("V1.0")
            app.push("latest")
        }
    }
}
