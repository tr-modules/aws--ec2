variable "name_prefix" {
  type        = string
}

variable "ami_id" {
  type        = string
  description = "AMI to use for the instance"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "Existing key name to use for EC2."
  default     = ""
}

variable "create_key_pair" {
  type    = bool
  default = false
}

variable "vpc_id" {
  type        = string
}

variable "subnet_id" {
  type        = string
}

variable "create_security_group" {
  type        = bool
  default     = true
  description = "Whether to create a new security group"
}

variable "security_group_id" {
  type        = string
  default     = ""
  description = "Existing security group ID to use (if not creating a new one)"
}

variable "security_group_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "security_group_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}