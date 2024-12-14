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

    stage('Update deployment') {
        sshagent(['ProdServer']) {
            sh 'ssh cyrogon@192.168.0.192 "kubectl rollout restart deployment cw2-server"'
        }
    }
}
