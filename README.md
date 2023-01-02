## Automate WordPress installation on AWS Ec2 instance using Terraform
This project simplifies WordPress application installation on Amazon Ec2 instances using Terraform.

#### Project Description

 This project is developed to demonstrate how to install WordPress application in AWS using Terraform. The frontend of the website is hosted on an independant Ec2 instance and the backend is managed using a second Ec2 instance. Access to the backend will be restricted as this is created within a private subnet. Public SSH access into both these instances are only be possible though a third Ec2 instance called a Bastion server. Frontend server is capable of accepting HTTP & HTTPS connections.
 
 AWS resources and their purpose in this project
1. **AWS VPC**  -This project is entirely created on an independant VPC 
2. **AWS InternetGateway**      - The Internet gateway is what brings internet connectivity into this VPC.
3. **AWS Subnet** - The project is configured to create private & public subnets using the cidrsubnet() function of terraform based on the number of Availability Zones in the working Region.
4. **AWS Nat-Gateway** - Nat gateway enables internet connectivity for instances created under private network.
5. **AWS Route Table** - For this project, we need route tables for private and public subnets each.
6. **AWS Elastic IP** - An elastic IP address should be assigned to Nat Gateway.
7. **Security Groups** - All three instances comes with indipendant security group and related group rules as follows:
       1. `Bastion-server Security Group` : This security group allows inbound SSH traffic from public internet.
       2. `Frontend-server Security Group` : The frontend-server security groups allows SSH traffic originates from Bastion server and HTTP/S traffic from internet.
       3. `Backend-server Security Group` - This security groups allows inbound SSH connection originates Bastion server security group and MySQL connection originates from Frontend-server security group.
8. **AWS Keypair** - All SSH access are keybased. A key-pair is generated locally and the public key is uploaded into the AWS using terraform.
9. **AWS Route53** - This project use both Public & Private Hosted Zone to create DNS records for Backend server and Frontend server
    1. `Private Hosted Zone` - Since updating the value of DB_HOST in wp-config.php file is challenging, a private hosted zone is created to define an A record whose IP address will be the private IP address of the Backend-server. This A record is used as the value of DB_HOST.
    2. `Public Hosted Zone` - An A record pointing to frontend-server public IP is created within the existing Public hosted zone.
    
10. **AWS Ec2 Instance** - Three Ec2 instances of type t2.micro are used for this project. Services like Apache and PHP7.4 are installed on the Frontend-server whereas, MariaDB service for managing the database of the application is deployed on the Backend-server which is placed in a private network. A third Ec2 instance called Bastion-server allows the administrators to gain SSH access to both frontend and backend servers.

#### How to run the project
##### Prerequisite
- It is desirable to have Terraform v1.3.6 and Terraform AWS provider version 4.48.0
- IAM user with Programmatic access to AWS with AmazonEc2FullAccess and AmazonRoute53FullAccess
- Git version 2.25.1

##### Use git clone to download the project files to your local system for execution
```
git clone https://github.com/sreejithsasidharan1989/aws-terraform-wordpress.git
```
##### Deploy the infrastructure using Terraform
```
$ cd  aws-terraform-wordpress
$ terraform validate
$ terraform plan
$ terraform apply
```


