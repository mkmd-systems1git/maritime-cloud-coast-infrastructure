variable "aws_region" {
  type        = string
  description = "The primary cloud data center region for the shore-based HQ operations center"
  default     = "eu-west-1" # Ireland data center (geographically optimal for Europe/Africa routing)
}

variable "vessel_fleet_name" {
  type        = string
  description = "The master naming convention for the active maritime vessel fleet pipeline data sinks"
  default     = "mombasa-edge-pipeline"
}
