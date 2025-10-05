resource aws_key_pair my_key {
        key_name = "terra_key_ec2"
        public_key = file("terra-key-ec2.pub")   
}

#vpc & sg

resource aws_default_vpc default {
  
}

resource aws_security_group my_security_group {
    name = "automate-sg"
    description = "this will add a TF generated security group"
    vpc_id = aws_default_vpc.default.id

    #inbound rule
     
     ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH open"
     }

     ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        
     }
  
  #outbound rule

   egress {
    from_port = 0
    to_port = 0 
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all access open outbound"
   }

    tags = {
      name = "automate-sg"
    }

}

#ec2 

resource "aws_instance" "my_instance" {
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_security_group.name]
    instance_type = "t2.micro"
    ami = "ami-0360c520857e3138f"
    user_data = file("install_nginx.sh")

    root_block_device {
       volume_size = 15
       volume_type = "gp3"
    }

     tags = {
       Name = "TWS_automate"
     }
  
}