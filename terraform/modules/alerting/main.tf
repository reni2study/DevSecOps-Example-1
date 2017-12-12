resource "aws_sns_topic" "sns_general_availability" {
  name = "${var.sns_general_availability_topic_name}"

  # https://github.com/hashicorp/terraform/issues/10697#issuecomment-312029088
  # SNS not supported in all regions
  # https://docs.aws.amazon.com/sns/latest/dg/sms_supported-countries.html
  provisioner "local-exec" {
    command = "aws sns subscribe --topic-arn ${self.arn} --protocol ${var.general_availability_protocol} --notification-endpoint ${var.general_availability_endpoint}"
  }
}