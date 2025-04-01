output "eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

# output "load_balancer_url" {
#   value = kubernetes_service.flask_lb_service.status[0].load_balancer.ingress[0].hostname
# }
