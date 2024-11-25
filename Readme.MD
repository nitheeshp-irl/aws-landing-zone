# AWS Landing Zone Deployment

This repository provides a solution for deploying an AWS Landing Zone, offering a scalable and secure multi-account environment following AWS best practices. It is designed to streamline account management, enforce governance, and enable resource isolation.

## Overview

The AWS Landing Zone simplifies the setup of a secure, scalable, and compliant AWS environment. This repository helps organizations rapidly establish and manage their Landing Zone using Infrastructure as Code (IaC).


## Architecture

This solution follows AWS best practices, ensuring security and scalability. The deployment includes:

### Core Accounts:
- Management Account
- Shared Services Account
- Logging Account

## Prerequisites

Before you deploy, ensure the following:

- AWS CLI is installed and configured.
- Terraform is installed (version >= 1.9).
- Access to AWS Management Account with sufficient permissions.
- AWS Organizations enabled in your account.

## Getting Started

Follow these steps to deploy the Landing Zone:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/nitheeshp-irl/aws-landing-zone.git
   cd aws-landing-zone