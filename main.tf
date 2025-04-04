provider "aws" {
  region = var.aws_region
}

module "eks" {
  source       = "./modules/eks"
  cluster_name = var.cluster_name
  subnet_ids   = var.subnet_ids
}


data "aws_eks_cluster" "eks" {
  name = var.cluster_name
  depends_on = [ module.eks ]
}

data "aws_eks_cluster_auth" "eks" {
  name = var.cluster_name
  depends_on = [ module.eks ]
}

module "backend" {
  source                 = "./modules/backend"
  image                  = var.image
  namespace              = var.namespace
  eks_cluster_endpoint   = data.aws_eks_cluster.eks.endpoint
  eks_cluster_auth_token = data.aws_eks_cluster_auth.eks.token
  eks_cluster_ca_cert    = data.aws_eks_cluster.eks.certificate_authority[0].data
}
