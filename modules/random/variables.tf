variable "company_name" {
  description = "The name of the company"
  type        = string
  
}

variable "environment" {
  description = "The deployment environment"
  type        = string
  default     = "dev"
}
