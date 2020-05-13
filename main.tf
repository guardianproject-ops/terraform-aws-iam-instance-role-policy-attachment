terraform {
  required_version = ">= 0.12"
}

module "label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"
  namespace   = var.namespace
  name        = var.name
  stage       = var.stage
  environment = var.environment
  delimiter   = var.delimiter
  attributes  = var.attributes
  tags        = var.tags
}

data "aws_iam_policy_document" "instance_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "instance" {
  name               = module.label.id
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role.json

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy_attachment" "default" {
  role = aws_iam_role.instance.id

  count = length(var.iam_policy_arns)

  policy_arn = var.iam_policy_arns[count.index]
}
