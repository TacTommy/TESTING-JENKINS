
# Security Group
resource "aws_security_group" "project-sc1" {
  name          = "project-sc1"
  description   = "project-work1" 
  vpc_id        = aws_vpc.project-8.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "1"
    cidr_blocks      = ["0.0.0.0/0"]
}
}

# Security Group
resource "aws_security_group" "project-sc2" {
  name          = "project-sc2"
  description   = "project-work2" 
  vpc_id        = aws_vpc.project-8.id

  ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }



  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "1"
    cidr_blocks      = ["0.0.0.0/0"]
}
}



# Database

# Create a Security Group for RDS
resource "aws_security_group" "rds_sg" {
  name_prefix = "rds-sg-"

  ingress {
    from_port   = 3306 
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id     = aws_vpc.project-8.id

  tags = {
    Name = "RDS Security Group"
  }
}

# RDS Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group1" {
  name       = "rds-subnet-grp"
  subnet_ids = [
    aws_subnet.project-8-priv-sub1.id, aws_subnet.project-8-priv-sub2.id]

  tags = {
    Name = "RDS Sub Group"
  }
}

# RDS Instance
resource "aws_db_instance" "projectdb" {
  allocated_storage    = 10
  storage_type         = var.storage_type1 
  engine               = var.engine1
  engine_version       = var.engine1_version   
  instance_class       = var.rds1_class
  db_name              = var.rds1_name
  username             = var.rds1_username
  password             = var.rds1_password
  parameter_group_name = var.rds1_group_name
  publicly_accessible  = var.rds1_accessible
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group1.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  tags = {
    Name11 = var.rds1_tags
  }
}



# FRONTEND EC2 

# EC2 Web servers 1
resource "aws_instance" "webserver-1" {
  ami           = var.web1_ami
  instance_type = var.web1_instance_type
  subnet_id     = aws_subnet.project-8-pub-sub1.id
  key_name    = var.web1_key
  vpc_security_group_ids = [aws_security_group.project-sc1.id]
  availability_zone = var.web1_zone
  

  associate_public_ip_address = var.associate_public_ip_address1

  tags = {
    Name12 = var.web1_tags
  }

  user_data = var.web1_user_data
}


# EC2 Web servers 2
resource "aws_instance" "webserver-2" {
  ami           = var.web2_ami
  instance_type = var.web2_instance_type
  
  subnet_id     = aws_subnet.project-8-pub-sub2.id
  key_name      = var.web2_key
  vpc_security_group_ids = [aws_security_group.project-sc1.id]
  availability_zone = var.web2_zone
  
  associate_public_ip_address = var.associate_public_ip_address2

  tags = {
    Name13 = var.web2_tags
  }

  user_data = var.web2_user_data
}



# BACKEND EC2


# EC2 Application server 1
resource "aws_instance" "application-server-1" {
  ami           = var.app1_ami
  instance_type = var.app1_instance_type
 
  subnet_id     = aws_subnet.project-8-priv-sub1.id
  key_name    = var.app1_key
  vpc_security_group_ids = [aws_security_group.project-sc1.id]
  availability_zone = var.app1_zone
  
  tags = {
    Name14 = var.app1_tags
  }

  user_data = var.app1_user_data
}


# EC2 Application server 2
resource "aws_instance" "application-server-2" {
  ami           = var.app2_ami
  instance_type = var.app2_instance_type
 
  subnet_id     = aws_subnet.project-8-priv-sub2.id
  key_name    = var.app2_key
  vpc_security_group_ids = [aws_security_group.project-sc1.id]
  availability_zone = var.app2_zone
  
  tags = {
    Name15 = var.app2_tags
  }

  user_data = var.app2_user_data
}




# Creating Target group

resource "aws_lb_target_group" "project-tg" {
  target_type   = var.target_type
  
  port     = 80
  protocol = var.target_protocol
  
  vpc_id   = aws_vpc.project-8.id
  ip_address_type   = var.target_ip_type

 health_check {
    path                = var.target_path
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = var.target_matcher
  }

  tags = {
    Project = var.target_tags
  }
}

# Instances to the Target Group
resource "aws_lb_target_group_attachment" "tg1" {
  target_group_arn = aws_lb_target_group.project-tg.arn
  target_id        = aws_instance.webserver-1.id 
  port             = 80 
}        

resource "aws_lb_target_group_attachment" "tg2" {
  target_group_arn = aws_lb_target_group.project-tg.arn
  target_id        = aws_instance.webserver-2.id 
  port             = 80 
}        

resource "aws_lb_target_group_attachment" "tg3" {
  target_group_arn = aws_lb_target_group.project-tg.arn
  target_id        = aws_instance.application-server-1.id 
  port             = 80 
}        


resource "aws_lb_target_group_attachment" "tg4" {
  target_group_arn = aws_lb_target_group.project-tg.arn
  target_id        = aws_instance.application-server-2.id 
  port             = 80 
}        



# Create a Launch Template
resource "aws_launch_template" "project-template" {
  name          = var.template_name
  image_id      = var.template_id 
  instance_type = var.template_type

  key_name = var.template_key

  network_interfaces {
    security_groups = [aws_security_group.project-sc1.id]
  }

  tag_specifications {
    resource_type = var.template_resource

    tags = {
      Name16 = var.template_tag
    }
  }
}

# Create an Auto Scaling Group

resource "aws_autoscaling_group" "project-auto-sg" {
  launch_template {
    id      = aws_launch_template.project-template.id
    version = var.auto_version
  }

  min_size         = 1
  max_size         = 3
  desired_capacity = 2

  vpc_zone_identifier = [
    aws_subnet.project-8-pub-sub1.id,
    aws_subnet.project-8-pub-sub2.id, 
    aws_subnet.project-8-priv-sub1.id, 
    aws_subnet.project-8-priv-sub1.id
  ]

  target_group_arns = [aws_lb_target_group.project-tg.arn] 

  health_check_type = var.check_type
  health_check_grace_period = 300

}

# Scaling Policies (Optional)
resource "aws_autoscaling_policy" "scale_out" {
  name                   = var.policy_out_name
  scaling_adjustment     = 1
  adjustment_type        = var.adjustment_out_type
  autoscaling_group_name = aws_autoscaling_group.project-auto-sg.name
}

resource "aws_autoscaling_policy" "scale_in" {
  name                   = var.policy_in_name
  scaling_adjustment     = -1
  adjustment_type        = var.adjustment_in_type
  autoscaling_group_name = aws_autoscaling_group.project-auto-sg.name
}




# Application Loadbalancer

resource "aws_lb" "project" {
  name               = var.balancer_name
  internal           = var.internal_or
  load_balancer_type = var.balancer_type
  security_groups    = [aws_security_group.project-sc1.id, aws_security_group.project-sc2.id]
  subnets           = [aws_subnet.project-8-pub-sub1.id, aws_subnet.project-8-pub-sub2.id]

  enable_deletion_protection = var.balancer_deletion

  
  tags = {
    project = var.balancer_tags
  }
}


# Listener for HTTP
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.project.arn
  port              = 80
  protocol          = var.listener_protocol

  default_action {
    type             = var.default_action
    target_group_arn = aws_lb_target_group.project-tg.arn
  }
}