output "eks_cluster_id" {
  description = "The EKS cluster ID"
  value       = aws_eks_cluster.eks.id
}

output "eks_cluster_endpoint" {
  description = "Endpoint for the Kubernetes API server"
  value       = aws_eks_cluster.eks.endpoint
}

output "eks_cluster_certificate_authority" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = aws_eks_cluster.eks.certificate_authority[0].data
}


output "eks_node_group_name" {
  description = "EKS Node Group Name"
  value       = aws_eks_node_group.eks_nodes.id
}
