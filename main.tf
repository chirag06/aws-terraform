provider "aws" {
  access_key = "AWS access key"
  secret_key = "AWS secret key"
  region = "us-east-2"
}

variable "ssh_key_private" {
  default     = "~/.ssh/test.pem"
}


resource "aws_instance" "app-store" {
  ami = "ami-0bbe28eb2173f6167"
  instance_type = "t2.micro"
  key_name = "test"
  tags = {
    Name = "app-store"
  }
  /*
  provisioner "remote-exec" {
    # Install Python for Ansible
    inline = ["sudo apt-get update -y",
              "sudo apt install python3-pip -y",
              "sudo apt-get install ansible -y",
              "sudo apt-get install -y python-boto",
              "sudo apt-get install -y python-boto3"]
    }
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.ssh_key_private)
      host     = aws_instance.app-store.public_ip
    }
    provisioner "file" {
      source      = "appstore-playbooks"
      destination = "/tmp/"
    }*/
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  final_snapshot_identifier = "foo"
  skip_final_snapshot       = true
}

resource "aws_s3_bucket" "b" {
  bucket = "loraine-lab-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
