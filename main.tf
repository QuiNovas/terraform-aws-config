data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      identifiers = [
        "config.amazonaws.com",
      ]
      type = "Service"
    }
  }
}

resource "aws_iam_role" "config_role" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  name               = local.config_name
  tags               = var.tags
}

data "aws_iam_policy_document" "role_policy" {
  statement {
    actions = [
      "s3:PutObject",
    ]
    resources = [
      aws_s3_bucket.config.arn,
      "${aws_s3_bucket.config.arn}/*",
    ]
  }

  statement {
    actions = [
      "sns:Publish",
    ]
    resources = [
      aws_sns_topic.config.arn
    ]
  }
}

resource "aws_iam_role_policy" "config" {
  name   = "config-bucket-access"
  policy = data.aws_iam_policy_document.role_policy.json
  role   = aws_iam_role.config_role.id
}

resource "aws_iam_role_policy_attachment" "config" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
  role       = aws_iam_role.config_role.name
}

resource "aws_config_configuration_recorder" "config" {
  name = var.name
  recording_group {
    include_global_resource_types = true
  }
  role_arn = aws_iam_role.config_role.arn
}

resource "aws_sns_topic" "config" {
  name = local.config_name
  tags = var.tags
}

resource "aws_config_delivery_channel" "config" {
  depends_on     = [aws_config_configuration_recorder.config]
  name           = var.name
  s3_bucket_name = aws_s3_bucket.config.id
  snapshot_delivery_properties {
    delivery_frequency = var.delivery_frequency
  }
  sns_topic_arn = aws_sns_topic.config.arn
}

resource "aws_config_configuration_recorder_status" "config" {
  depends_on = [aws_config_delivery_channel.config]
  is_enabled = var.enable_recorder
  name       = aws_config_configuration_recorder.config.name
}

resource "aws_config_config_rule" "rule" {
  count            = var.rules_count
  depends_on       = [aws_config_configuration_recorder.config]
  input_parameters = lookup(var.input_parameters, element(var.rules, count.index), "")
  name             = element(var.rules, count.index)

  #  scope             = ["${local.scopes[contains(keys(local.scopes), element(var.rules, count.index)) ? element(var.rules, count.index) : local.default_scope_key]}"]
  source {
    owner             = "AWS"
    source_identifier = local.source_identifiers[element(var.rules, count.index)]
  }

  tags = var.tags
}

