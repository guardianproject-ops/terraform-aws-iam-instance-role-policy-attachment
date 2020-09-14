terraform {
  required_version = ">= 0.12"
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
  name               = module.this.id
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
