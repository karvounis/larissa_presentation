variable "costs_threshold" {
  description = "The threshold of cost for the budget"
  type        = string
}

variable "user" {
  description = "user specfic information"
  type        = map(string)
}

variable "sms_sender_id" {
  description = "SMS Sender ID"
  type        = string
  default     = "AWSpersonal"
}

resource "aws_budgets_budget" "global_monthly_allowance_forecasted_costs" {
  budget_type       = "COST"
  limit_amount      = var.costs_threshold
  limit_unit        = "USD"
  time_period_start = "2020-01-01_00:00"
  time_unit         = "MONTHLY"
  name              = "Global monthly forecasted costs"
  account_id        = data.aws_caller_identity.current.account_id

  provider = aws.us-east-1
}

resource "aws_sns_topic" "topic_budget_alerting" {
  name = "topic-budget-alerting"
  provider = aws.us-east-1
}

resource "aws_cloudwatch_metric_alarm" "account_billing_alarm" {
  alarm_name          = "Billing alarm"
  alarm_description   = "Notify when we are nearing the set threshold"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "21600"
  statistic           = "Maximum"
  threshold           = var.costs_threshold
  provider            = aws.us-east-1

  alarm_actions = [
    aws_sns_topic.topic_budget_alerting.arn,
  ]

  dimensions = {
    Currency = "USD"
  }

  depends_on = [aws_sns_topic.topic_budget_alerting]
}

resource "aws_sns_topic_subscription" "topic_name_sms_karvounis" {
  topic_arn              = aws_sns_topic.topic_budget_alerting.arn
  protocol               = "sms"
  endpoint               = var.user["phone"]
  endpoint_auto_confirms = true
  provider               = aws.us-east-1

  depends_on = [aws_sns_topic.topic_budget_alerting]
}

resource "aws_s3_bucket" "logs_sms" {
  bucket   = "personal-aws-karvounis-logs-sms"
  acl      = "private"
  provider = aws.us-east-1

  tags = {
    Name  = "All sms logs related to personal usage"
    Scope = "Logs"
  }
}

resource "aws_sns_sms_preferences" "update_sms_prefs" {
  monthly_spend_limit          = "1"
  default_sender_id            = var.sms_sender_id
  default_sms_type             = "Transactional"
  usage_report_s3_bucket       = aws_s3_bucket.logs_sms.bucket
  delivery_status_iam_role_arn = "arn:aws:iam::773336937832:role/SNSSuccessFeedback"
  provider                     = aws.us-east-1

  depends_on = [aws_s3_bucket.logs_sms]
}
