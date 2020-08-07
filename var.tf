variable "region" {
  default = "ap-south-1"
}
variable "domain_name" {
  default     = "dkatlis"
  description = "Elastic search domain name"
}
variable "elasticsearch_version" {
  default     = "6.8"
  description = "ES version"
}
variable "instance_type" {
  default     = "t2.small.elasticsearch"
  description = "Instance type of the cluster"
}
variable "instance_count" {
  type        = number
  default     = 1
  description = "number of nodes in the cluster"
}

variable "zone_awareness_enabled" {
  default     = false 
  description = "Enable the zone awareness for the Cluster"
}
variable "availability_zone_count" {
  default     = 2 
  description = "Number of availability zone for the domain"
}

variable "ebs_volume_size" {
  default = 20
}

variable "ebs_volume_type" {
  default     = "gp2"
  description = "storage type of EBS volume"
}
variable "ebs_iops" {
  default     = 0
  description = "I/O performance of the EBS volume attached to the data nodes"
}


variable "log_publishing_application_enabled" {
  default     = false
  description = "Specifies whether log publishing option for ES_APPLICATION_LOGS is enabled or not"
}

variable "automated_snapshot_start_hour" {
  default     = 0
  description = "hour at which automated snapshot are taken"
}

variable "dedicated_master_type" {
  default = "t2.small.elasticsearch"
}
variable "node_to_node_encryption_enabled" {
  default     = false
  description = "Whether to enable node-to-node encryption"
}

variable "dedicated_master_enabled" {
  default     = false
  description = "To tell whether dedicated master enabled for the cluster"
}
variable "dedicated_master_count" {
  type    = number
  default = 0
}

variable "advanced_options" {

  type        = map(string)
  default     = {}
  description = "key-value to specify advanced configuration options"
}
variable "log_publishing_application_cloudwatch_log_group_arn" {
  default     = ""
  description = "ARN of the cloudwatch log group to which log for ES_APPLICATION_LOGS needed to be published"
}

