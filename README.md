# Terraform AWS VPC with NGINX Web Server

## Project Overview

This project provisions an AWS infrastructure using Terraform to deploy a web server running NGINX. The project includes the following components:

- A Virtual Private Cloud (VPC) with both public and private subnets.
- An EC2 instance launched in the public subnet with an NGINX web server installed.
- A security group with rules to enable HTTP access.
- The output displays the public URL of the web server on the terminal upon successful deployment.

---

## Features

- **VPC Setup**:
  - Includes public and private subnets for enhanced network segregation.
  - Allows scalable infrastructure setup.
  
- **EC2 Instance**:
  - Hosted in the public subnet.
  - Pre-configured with an NGINX web server.

- **Security Group**:
  - Configured to allow inbound HTTP traffic (port 80) from anywhere.

- **Outputs**:
  - Provides the web server's public URL directly in the terminal.

---

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html)
- AWS CLI configured with appropriate credentials
- An AWS account

---

## Usage Instructions

### Step 1: Clone the Repository
Clone this repository to your local machine:
```bash
git clone <repository-url>
cd <project-folder>
```

### Step 2: Initialize Terraform
Run the following command to initialize Terraform in your project directory:
```bash
terraform init
```

### Step 3: Preview Changes
Generate and review the execution plan:
```bash
terraform plan
```

### Step 4: Apply Changes
Deploy the resources to AWS:
```bash
terraform apply
```

When prompted, type `yes` to confirm.

### Step 5: Access the NGINX Web Server
Once the infrastructure is provisioned, Terraform outputs the web server's URL:
```bash
Outputs:
web_server_url = http://<public-ip>
```

Open the URL in your browser to access the NGINX default welcome page.

---

## Project Structure

```
.
├── main.tf          # Main configuration file for Terraform
├── providers.tf     # Configures AWS provider
├── vpc.tf           # Defines VPC and subnets
├── ec2.tf           # Configures EC2 instance
├── security-grp.tf  # Defines security group rules
├── output.tf        # Outputs the web server URL
├── terraform.lock.hcl  # Tracks provider version
```

---

## Known Issues and Resolutions

1. **Security Group Configuration**:
   - Faced an error related to the incorrect structure of the `egress` block.
   - Resolved by ensuring all required attributes were included, such as `ipv6_cidr_blocks` and `self`.

2. **AWS Connection Issue**:
   - Faced connection issues due to invalid credentials.
   - Resolved by reconfiguring the AWS CLI using `aws configure` with the correct access and secret keys.

---

## Cleanup

To destroy the created resources and avoid unnecessary costs:
```bash
terraform destroy
```

When prompted, type `yes` to confirm.

---

## Future Enhancements

- Add private EC2 instances in the private subnet.
- Configure a load balancer for better availability.
- Add SSL/TLS for secure communication.

---

## Author

This project was created to practice Terraform and AWS infrastructure setup. Contributions are welcome!
