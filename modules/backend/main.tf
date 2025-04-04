

provider "kubernetes" {
  host                   = var.eks_cluster_endpoint
  token                  = var.eks_cluster_auth_token
  cluster_ca_certificate = base64decode(var.eks_cluster_ca_cert)
}

resource "kubernetes_deployment" "backend" {
  metadata {
    name      = "backend"
    namespace = var.namespace
    labels = {
      app = "backend"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "backend"
      }
    }

    template {
      metadata {
        labels = {
          app = "backend"
        }
      }

      spec {
        container {
          name  = "backend"
          image = var.image

          port {
            container_port = 3000
          }

          resources {
            limits   = { cpu = "500m", memory = "512Mi" }
            requests = { cpu = "250m", memory = "256Mi" }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "backend_service" {
  metadata {
    name      = "backend-service"
    namespace = var.namespace
  }

  spec {
    selector = {
      app = "backend"
    }

    port {
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}
