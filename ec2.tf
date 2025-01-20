resource "aws_instance" "nginx_server" {
    ami = "ami-04b4f1a9cf54c11d0"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.ngc_sec_grp.id]
    associate_public_ip_address = true

    user_data = <<-EOF
                #!/bin/bash
                sudo yum install nginx -y
                sudo systemctl start nginx  
                EOF

    tags = {
      Name = "nginx_server"
    }

    
}