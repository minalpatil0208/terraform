module "ec2" {
  source = "home/minal/terraform/Module/main/EC2"
  webserver_ami = ami-0317b0f0a0144b137
  webserver_instance_type = t3.small
  webserver_key_name = swami
  webserver_vpc_security_group_ids = module.vpc.webserversg
  webserver_disable_api_termination = true
  webserver_subnet_id = module.vpc.subnet_id

} 

module "vpc" {
  source = "home/minal/terraform/Module/main/VPC"
  vpc_cidr = "172.30.0.0/16"
  vpc_subnetA_cidr = "172.30.128.0/20"
  public_ip = true
  az = "ap-south-1"
}

