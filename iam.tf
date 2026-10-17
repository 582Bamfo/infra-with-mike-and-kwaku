terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

#IAM Use
resource "aws_iam_user" "kevin-user" {
  name = "kevin-Owusu"
  path = "/system/"

  tags = {
    Name  = "kevin Owusu"
    managed_by = "Terraform"
    team = "DevOps"
  }
}

resource "aws_iam_user" "chin-user" {
  name = "chin-Owusu"
  path = "/system/"

  tags = {
    Name  = "chin Owusu"
    managed_by = "Terraform"
    team = "DevOps"
  }
}



#iam group
resource "aws_iam_group" "devops-group" {
  name = "DevOps"
  path = "/users/"
}

resource "aws_iam_group_membership" "team" {
  name = "team-membership"
  users = [
   aws_iam_user.kevin-user.name,
   
  ]
  group = aws_iam_group.devops-group.name
}


resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = aws_iam_group.devops-group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}