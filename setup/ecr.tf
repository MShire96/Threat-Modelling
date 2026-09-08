resource "aws_ecr_repository" "threat" {
  name                 = var.tf_state_bucket
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}