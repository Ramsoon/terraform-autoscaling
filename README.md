

# Terraform AWS Auto Scaling Project

## Overview

This project provisions AWS infrastructure using Terraform to demonstrate Auto Scaling functionality. It launches EC2 instances based on a launch template and automatically scales the number of instances up or down according to CPU usage thresholds.

The setup is purely for testing purposes, with security rules allowing SSH access and all outbound traffic to make the demonstration straightforward.


## Key Features

* Launch Template
  Defines the instance configuration including AMI, instance type, SSH key, security group, and a user data script.

* Auto Scaling Group (ASG)
  Automatically:

  * Scales up by adding one EC2 instance when average CPU usage is above 30%.
  * Scales down by removing one EC2 instance when CPU usage drops below 5%.

* CloudWatch Alarms
  Monitors CPU utilization and triggers scaling policies.

* Custom Script Installation
  The `bash/install_stres.sh` script is run on instance launch to:

  * Install system updates
  * Install the `stress` tool for CPU load testing
  * Provide instructions on how to manually stress the CPU


## Project Structure

.
├── alarm.tf            # CloudWatch alarms for scaling
├── autoscaling.tf      # Auto Scaling Group and scaling policies
├── main.tf             # Launch template configuration
├── profile.tf          # AWS provider configuration
├── sec_grp.tf          # Security group configuration
├── variable.tfvars     # Variables file
├── vpc_default.tf      # Default VPC reference
├── bash/
│   └── install_stres.sh # Script to install and run stress tool


## Usage

1. Generate or provide an existing AWS key pair for SSH access.
2. Update `variable.tfvars` with your AWS region, key pair name, and other settings.
3. Run Terraform commands:


   terraform init
   terraform plan
   terraform apply

4. Once the instance launches, SSH into it and run:


   stress --cpu 2 --timeout 300


   to trigger CPU load and test the auto scaling behavior.


## Notes

* This setup uses a default VPC and is intended for testing only.
* Security group rules are wide open for demonstration purposes and should be tightened for production environments.
* The CPU thresholds are intentionally low to make testing easier.

