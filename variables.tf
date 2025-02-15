
# Variables for vpc resources

variable "region" {
    description = "AWS region"
    default     = "eu-west-1"
}


variable "vpc_cidr_block" {
    description = "AWS cidr-block"
    default     = "10.0.0.0/16"
}


variable "instance_tenancy" {
    description = "tenancy for vpc"
    default     = "default"
}


variable "dns_hostname" {
    description = "dns hostname"
    default     = "true"
}

variable "tags" {
    description = "vpc-tags"
    default     = "development"
}


variable "project-8-pub-sub1_cidr-block" {
    description = "subnet cidr block 1"
    default     = "10.0.10.0/24"
}


variable "subnet_tags1" {
    description = "subnet tags1"
    default     = "Project-8-pub-sub1"
}


variable "project-8-pub-sub2_cidr-block" {
    description = "subnettags2"
    default     = "10.0.11.0/24"
}

variable "subnet_tags2" {
    description = "subnet tags2"
    default     = "Project-8-pub-sub2"
}


variable "priv-sub1-cidr_block" {
    description = "private sub cidr block1"
    default     = "10.0.12.0/24"
}

variable "tags_priv1" {
    description = "private sub1"
    default     = "project-8-priv-sub1"
}


variable "priv-sub2-cidr_block" {
    description = "private sub cidr block2"
    default     = "10.0.13.0/24"
}


variable "sunet_tags3" {
    description = "private sub cidr block2"
    default     = "project-8-priv-sub2"
}


variable "pub_sub1_zone" {
    description = "public sub1 zone"
    default     = "eu-west-1a"
}


variable "pub_sub2_zone" {
    description = "public sub2 zone"
    default     = "eu-west-1b"
}


variable "priv_sub1_zone" {
    description = "private sub1 zone"
    default     = "eu-west-1a"
}


variable "priv_sub2_zone" {
    description = "private sub2 zone"
    default     = "eu-west-1b"
}


variable "tags_project-8-pub-route-table" {
    description = "route table tags 1"
    default     = "Project-8-pub-route-table"
}


variable "tags_project-8-priv-route-table" {
    description = "route table tags 2"
    default     = "Project-8-priv-route-table"
}


variable "tags_igw" {
    description = "internet gw tags"
    default     = "project-8-igw"
}



variable "igw_route_cidr" {
    description = "igw destination cidr"
    default     = "0.0.0.0/0"
}


variable "nat-eip" {
    description = "eip tag"
    default     = "nat-eip"
}



variable "nat-eip_domain" {
    description = "domain for nat eip"
    default     = "vpc"
}


variable "nat-gateway" {
    description = "nat gw tags"
    default     = "nat-gateway"
}




# Variables for rds

variable "storage_type1" {
    description = "rds1 storage type"
    default     = "gp2"
}

variable "engine1" {
    description = "rds1 engine"
    default     = "mysql"
}


variable "engine1_version" {
    description = "rds1 engine version"
    default     = "8.0"
}


variable "rds1_class" {
    description = "rds1 instance class"
    default     = "db.t3.micro"
}


variable "rds1_name" {
    description = "rds1 instance class"
    default     = "projectdb"
}

variable "rds1_username" {
    description = "rds1 instance username"
    default     = "admin"
}


variable "rds1_password" {
    description = "rds1 instance password"
    default     = "yourpassword"
}


variable "rds1_group_name" {
    description = "rds1 parameter group name"
    default     = "default.mysql8.0"
}


variable "rds1_accessible" {
    description = "rds1 public accessibility"
    default     = true
}


variable "rds1_tags" {
    description = "rds1 tags"
    default     = "Project RDS Instance"
}



# FRONTEND EC2 

# EC2 Web servers 1

variable "web1_ami" {
    description = "ami for server 1"
    default     = "ami-02141377eee7defb9"
}


variable "web1_instance_type" {
    description = "instance type for server 1"
    default     = "t2.micro"
}


variable "web1_key" {
    description = "key pair for server 1"
    default     = "Ireland-Keypair"
}


variable "web1_zone" {
    description = "availability zone for server 1"
    default     = "eu-west-1a"
}


variable "web1_tags" {
    description = "tags for server 1"
    default     = "Front-end-1"
}


variable "web1_user_data" {
    description = "user data for server 1"
    default     = <<-EOF
  #!/bin/bash
  # Update and install httpd
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>kwaku Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}



# EC2 Web servers 2

variable "web2_ami" {
    description = "ami for server 2"
    default     = "ami-02141377eee7defb9"
}


variable "web2_instance_type" {
    description = "instance type for server 2"
    default     = "t2.micro"
}


variable "web2_key" {
    description = "key pair for server 2"
    default     = "Ireland-Keypair"
}


variable "web2_zone" {
    description = "availability zone for server 2"
    default     = "eu-west-1b"
}


variable "web2_tags" {
    description = "tags for server 2"
    default     = "Front-end-2"
}


variable "web2_user_data" {
    description = "user data for server 2"
    default     = <<-EOF
  #!/bin/bash
  # Update and install httpd
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>kwaku Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}




# BACKEND EC2


# EC2 Application server 1

variable "app1_ami" {
    description = "ami for application server 1"
    default     = "ami-02141377eee7defb9"
}


variable "app1_instance_type" {
    description = "instance type for application server 1"
    default     = "t2.micro"
}


variable "app1_key" {
    description = "key pair for application server 1"
    default     = "Ireland-Keypair"
}


variable "app1_zone" {
    description = "availability zone for application server 1"
    default     = "eu-west-1a"
}


variable "app1_tags" {
    description = "tags for application server 1"
    default     = "Back-end-1"
}


variable "app1_user_data" {
    description = "user data for application server 1"
    default     = <<-EOF
  #!/bin/bash
  # Update and install httpd
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>kwaku Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}



# EC2 Application server 2

variable "app2_ami" {
    description = "ami for application server 2"
    default     = "ami-02141377eee7defb9"
}


variable "app2_instance_type" {
    description = "instance type for application server 2"
    default     = "t2.micro"
}


variable "app2_key" {
    description = "key pair for application server 2"
    default     = "Ireland-Keypair"
}


variable "app2_zone" {
    description = "availability zone for application server 2"
    default     = "eu-west-1b"
}


variable "app2_tags" {
    description = "tags for application server 2"
    default     = "Back-end-2"
}


variable "app2_user_data" {
    description = "user data for application server 2"
    default     = <<-EOF
  #!/bin/bash
  # Update and install httpd
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>kwaku Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF
}


# Creating Target group

variable "target_type" {
    description = "target type for the target group"
    default     = "instance"
}


variable "target_protocol" {
    description = "protocol for the target group"
    default     = "HTTP"
}

variable "target_ip_type" {
    description = "ip address type for the target group"
    default     = "ipv4"
}


variable "target_path" {
    description = "path for the target group"
    default     = "/"
}

variable "target_matcher" {
    description = "matcher for the target group"
    default     = "200"
}


variable "target_tags" {
    description = "tags for the target group"
    default     = "tg"
}



# Creating a Launch Template

variable "template_name" {
    description = "the name of the launch template"
    default     = "project-launch-template"
}


variable "template_id" {
    description = "image id of the launch template"
    default     = "ami-0a094c309b87cc107"
}


variable "template_type" {
    description = "instance type of the launch template"
    default     = "t2.micro"
}


variable "template_key" {
    description = "key pair of the launch template"
    default     = "Ireland-Keypair"
}


variable "template_resource" {
    description = "tag specification of the launch template"
    default     = "instance"
}


variable "template_tag" {
    description = "tag name of the launch template"
    default     = "project-instance"
}


# Create an Auto Scaling Group

variable "auto_version" {
    description = "scaling version"
    default     = "$Latest"
}


variable "check_type" {
    description = "health check type"
    default     = "EC2"
}




# Scaling Policies (Optional)

variable "policy_out_name" {
    description = "scaling out policy name"
    default     = "scale-out-policy"
}


variable "adjustment_out_type" {
    description = "scaling out policy adjustment type"
    default     = "ChangeInCapacity"
}


variable "policy_in_name" {
    description = "scaling in policy name"
    default     = "scale-in-policy"
}


variable "adjustment_in_type" {
    description = "scaling in policy adjustment type"
    default     = "ChangeInCapacity"
}



# Application Loadbalancer

variable "balancer_name" {
    description = "the name of load balancer"
    default     = "DB1"
}


variable "internal_or" {
    description = "the location of load balnacer"
    default     = false
}


variable "balancer_type" {
    description = "the type of load balnacer"
    default     = "application"
}


variable "balancer_deletion" {
    description = "load balnacer deletion protection"
    default     = false
}


variable "balancer_tags" {
    description = "load balnacer tags"
    default     = "project"
}


# Listener for HTTP
variable "listener_protocol" {
    description = "listener protocol"
    default     = "HTTP"
}

variable "default_action" {
    description = "listener default action"
    default     = "forward"
}