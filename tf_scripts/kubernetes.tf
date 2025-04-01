resource "kubernetes_deployment" "flask_app" {
  metadata {
    name = "flask-app"
    labels = {
      app = "flask-app"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "flask-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "flask-app"
        }
      }

      spec {
        container {
          image = "nnamdi92/my-flask-app:latest"
          name  = "flask-container"

          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "flask_lb_service" {
  metadata {
    name = "flask-lb-service"
  }

  spec {
    selector = {
      app = kubernetes_deployment.flask_app.metadata[0].labels.app
    }

    type = "LoadBalancer"

    port {
      port        = 5000
      target_port = 5000
      protocol    = "TCP"
    }
  }
}