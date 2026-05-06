#ECR Repository
resource "aws_ecr_repository" "ecr_site" {
  name                 = "site_pro"
  image_tag_mutability = "MUTABLE"
}