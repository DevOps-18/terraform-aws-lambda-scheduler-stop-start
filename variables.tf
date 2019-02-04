# Terraform variables file

# Set cloudwatch events for shutingdown instances
# Shutdown tous les vendredis
# Shutdow à noel à 22h : ["cron(0 22 ? * FRI *)","cron(00 22 24 12 ? *)"]
# Shutdown tous les soirs à 22h du lundi au vendredi
# cf doc : https://docs.aws.amazon.com/lambda/latest/dg/tutorial-scheduled-events-schedule-expressions.html
variable "cloudwatch_schedule_expression" {
  description = "Define the aws cloudwatch event rule schedule expression"
  default = "cron(0 22 ? * MON-FRI *)"
}

variable "schedule_action" {
  description = "Define schedule action to apply on resources, accepted value are 'stop or 'start"
  default = "stop"
}

variable "resources_tag" {
  type = "map"
  description = "Set the tag use for identify resources to stop or start"
  default = {
    key   = "tostop"
    value = "true"
  }
}

variable "ec2_schedule" {
  description = "Enable scheduling on ec2 resources"
  default = "false"
}

variable "rds_schedule" {
  description = "Enable scheduling on rds resources"
  default = "false"
}

variable "autoscaling_schedule" {
  description = "Enable scheduling on autoscaling group resources"
  default = "false"
}

variable "autoscaling_params" {
  description = "Define min_size instance to apply when autoscalingroup starting up"
  default = <<EOF
"{\"my_autoscalinggroup_name1\": \"1\",
  \"my_autoscalinggroup_name2\": \"3\",
  \"my_autoscalinggroup_name3\": \"2\"}"
EOF
}