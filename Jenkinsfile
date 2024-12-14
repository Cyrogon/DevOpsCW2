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
            sh 'curl localhost:8080'
        }
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker') {
            app.push("${env.BUILD_VERSION}")
            app.push("latest")
        }
    }
}
