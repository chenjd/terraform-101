variable "regions" {
  description = "A set of regions"
  type        = set(string)
  default     = ["australiaeast", "australiasoutheast", "australiacentral"]
}