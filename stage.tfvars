
region              = "us-west-1"
vpc_cidr_block      = "10.0.0.0/16"
instance_tenancy    = "default"
dns_hostname        = "true"
tags                = "practice" 

project-8-pub-sub1_cidr-block = "10.0.10.0/24"
subnet_tags1        = "Practice-8-pub-sub1" 

project-8-pub-sub2_cidr-block = "10.0.11.0/24"
subnet_tags2        = "Practice-8-pub-sub2" 

priv-sub1-cidr_block    = "10.0.12.0/24"
tags_priv1              = "Practice-8-priv-sub1"

priv-sub2-cidr_block    = "10.0.13.0/24"
sunet_tags3             = "Practice-8-priv-sub2" 

pub_sub1_zone           = "us-west-1a"
pub_sub2_zone           = "us-west-1b"
priv_sub1_zone          = "us-west-1a"
priv_sub2_zone          = "us-west-1b"


tags_project-8-pub-route-table = "Practice-8-pub-route-table" 
tags_project-8-priv-route-table = "Practice-8-priv-route-table" 

tags_igw         = "Practice-8-igw" 
igw_route_cidr   = "0.0.0.0/0"

nat-eip          = "nat-eip"
nat-eip_domain   = "vpc"
nat-gateway      = "nat-gateway"

storage_type1    = "gp2"
engine1          = "mysql"
engine1_version  = "8.0"
rds1_class       = "db.t3.micro"
rds1_name        = "projectdb"
rds1_username    = "admin"
rds1_password    = "yourpassword"
rds1_group_name  = "default.mysql8.0"
rds1_accessible  = true
rds1_tags          = "Practice RDS Instance"

web1_ami           = "ami-0aa117785d1c1bfe5"
web1_instance_type = "t2.micro"
web1_key           = "California-key-pair"
web1_zone          = "us-west-1a"
web1_tags          = "Front-end-1"

web1_user_data  = <<-EOF
  #!/bin/bash
  # Update and install httpd
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>kwaku Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF

web2_ami           = "ami-0aa117785d1c1bfe5"
web2_instance_type = "t2.micro"
web2_key           = "California-key-pair"
web2_zone          = "us-west-1b"
web2_tags          = "Front-end-2" 

web2_user_data     = <<-EOF
  #!/bin/bash
  # Update and install httpd
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>kwaku Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF

app1_ami           = "ami-0aa117785d1c1bfe5"
app1_instance_type = "t2.micro"
app1_key           = "California-key-pair"
app1_zone          = "us-west-1a"
app1_tags          = "Back-end-1" 

app1_user_data      = <<-EOF
  #!/bin/bash
  # Update and install httpd
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>kwaku Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF

app2_ami           = "ami-0aa117785d1c1bfe5"
app2_instance_type = "t2.micro"
app2_key           = "California-key-pair"
app2_zone          = "us-west-1b"
app2_tags          = "Back-end-2"            

app2_user_data      = <<-EOF
  #!/bin/bash
  # Update and install httpd
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>kwaku Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF

target_type           = "instance"
target_protocol       = "HTTP"
target_ip_type        = "ipv4"
target_path           = "/"
target_matcher        = "200"
target_tags           = "tg" 

template_name         = "Practice-launch-template"
template_id           = "ami-0aa117785d1c1bfe5"
template_type         = "t2.micro"
template_key          = "California-key-pair"
template_resource     = "instance"
template_tag          = "Practice-instance" 

auto_version            = "$Latest"
check_type              = "EC2"

policy_out_name         = "scale-out-policy"
adjustment_out_type     = "ChangeInCapacity"

policy_in_name          = "scale-in-policy"
adjustment_in_type      = "ChangeInCapacity"

balancer_name           = "DB1"
internal_or             = false
balancer_type           = "application"
balancer_deletion       = false
balancer_tags           = "Practice" 

listener_protocol       = "HTTP"
default_action          = "forward" 