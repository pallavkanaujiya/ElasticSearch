# Role for the Pod to assume to access ES

resource "aws_iam_role" "elasticsearch_user" {
  name               = "module.user_label.id"
  assume_role_policy = join("", data.aws_iam_policy_document.default.*.json)
  description        = "IAM Role to assume to access the ES module.label.id cluster"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    principals {
      type        = "service"
      identifiers = ["ec2.amazonaws.com"]
    }
    effect = "Allow"
  }
}
data "aws_iam_policy_document" "default" {
  statement {
    actions = ["es:*", ]
    resources = [
      join("", aws_elasticsearch_domain.default.*.arn),
      "${join("", aws_elasticsearch_domain.default.*.arn)}/*"
    ]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}
resource "aws_elasticsearch_domain_policy" "default" {
  domain_name     = "dkatlis"
  access_policies = join("", data.aws_iam_policy_document.default.*.json)
}
