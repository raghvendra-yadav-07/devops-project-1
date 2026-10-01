variable "vpc_cidr_block" {

  default = "10.0.0.0/16"
  type    = string

}
#cidr for my public subnet 
variable "pulic_cidr_block" {
  default = "10.0.0.0/20"
  type    = string

}
#cidr for my private subnet 
variable "private_cidr_block" {
  default = "10.0.16.0/20"
  type    = string

}
# for ssh in my subnet my ip address
variable "my_ip" {
  default = "49.237.100.104/32"
  type    = string


}

variable "db_password" {
  description = "The master password for the RDS instance"
  type        = string
  sensitive   = true
  
  # Correct way to assign a default value
  default     = "SuperSecurePassword123!" 
}
