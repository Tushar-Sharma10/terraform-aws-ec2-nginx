# Terraform AWS EC2 with Nginx Web Server

This project uses **Terraform** to provision an **Ubuntu EC2 instance** on **AWS**, automatically installs **Nginx**, 
and serves a basic HTML page using a `user_data` script.

---

## 📁 Project Structure

├── main.tf # Core infrastructure resources

├── variables.tf # Input variables

├── outputs.tf # Output values (e.g., public IP)

├── user_data.sh # Script to install Nginx and serve HTML


---

## 🚀 Features

- ✅ EC2 instance with Ubuntu 22.04
- ✅ Installs Nginx automatically on launch
- ✅ Serves a custom HTML page
- ✅ SSH access on port 22
- ✅ HTTP access on port 80
- ✅ Uses key pair and security group configuration
- ✅ Easily configurable with variables

---

## 🛠️ Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- AWS credentials configured (`~/.aws/credentials`)
- SSH key pair (public key placed in `~/.ssh/my-aws-key.pub`)

---

## 📦 How to Use

### 1. Clone the repository


[git clone https://github.com/tushar-sharma10/terraform-aws-ec2-nginx.git](https://github.com/Tushar-Sharma10/terraform-aws-ec2-nginx.git)

cd terraform-aws-ec2-nginx

### 2. Initialise Terraform

terraform init

### 3. Apply the configuration

terraform apply -auto-approve

### 4. SSH into Ec2 Instance

ssh -i ~/.ssh/my-aws-key ubuntu@<EC2_PUBLIC_IP>


## Future Improvements

- **Add Elastic IP** to assign a static public IP to the EC2 instance for consistent access.  
- **Use Terraform Modules** to modularize infrastructure and improve reusability.  
- **Implement Auto Scaling Group** for better scalability and availability.  
- **Integrate with Load Balancer** (ALB or ELB) to distribute traffic across multiple instances.  
- **Use Terraform State Backend** like S3 + DynamoDB for state locking and remote collaboration.  
- **Add monitoring and alerting** with CloudWatch for better observability.  
- **Parameterize user_data script** to support multiple web server options or configurations.  
- **Implement HTTPS** by provisioning SSL certificates via AWS Certificate Manager and configuring Nginx accordingly.  
- **Add IAM roles and policies** for fine-grained permissions and security best practices.  


