output "ec2-public_ip" {
    value = aws_instance.my_instance.public_ip
}

output "ec2_pub_dns" {
    value = aws_instance.my_instance.public_dns  
}

output "ec2_pri_ip" {
    value = aws_instance.my_instance.private_ip
    }