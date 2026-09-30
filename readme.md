# Terraform Infrastructure CI/CD

## Project Overview

This repository is being used to learn and build an AWS infrastructure
project with Terraform and GitHub Actions.

The project is currently at the initial CI/CD workflow stage. The
infrastructure design and Terraform configuration will be added and
documented gradually as the project develops.

## Current CI/CD Workflow

The GitHub Actions workflow is named `terraform-deploy`.

It runs when code is pushed to the `main` branch and currently performs
these steps:

1.  Checks out the repository.
2.  Configures AWS credentials from GitHub repository secrets.
3.  Sets up Terraform.
4.  Runs `terraform init`.
5.  Runs `terraform validate`.
6.  Runs `terraform plan`.
7.  Runs `terraform apply -auto-approve`.

### Workflow Configuration

  -----------------------------------------------------------------------
  Setting                             Current value
  ----------------------------------- -----------------------------------
  Workflow name                       `terraform-deploy`

  Trigger                             Push to `main`

  GitHub Actions runner               `ubuntu-latest`

  AWS region                          `us-east-1`

  Terraform version                   `1.16.4`

  AWS credentials                     `AWS_ACCESS_KEY_ID` and
                                      `AWS_SECRET_ACCESS_KEY` GitHub
                                      secrets
  -----------------------------------------------------------------------

## Important Safety Note

The current workflow automatically runs `terraform apply -auto-approve`
after a push to `main`. This can create, modify, or destroy AWS
resources depending on the Terraform configuration.

Before using this workflow for real infrastructure:

-   Confirm the Terraform configuration and execution directory.
-   Use an AWS identity with only the permissions the project needs.
-   Keep AWS credentials out of the repository and store them only in
    GitHub Secrets.
-   Review the Terraform plan before applying changes.
-   Consider replacing long-lived AWS access keys with GitHub OIDC and
    adding an approval step before production applies.
-   Check AWS costs and destroy temporary lab resources when they are no
    longer needed.

## Project Status

-   [x] Initial GitHub Actions workflow created
-   [x] Workflow run completed successfully
-   [ ] Terraform infrastructure configuration
-   [ ] Terraform formatting and validation checks
-   [ ] Remote Terraform state and locking
-   [ ] AWS authentication using GitHub OIDC
-   [ ] Reviewed plan and controlled apply
-   [ ] Project architecture and deployment documentation

## Future Updates

This README will be updated as the project progresses, including:

-   AWS architecture and resource details
-   Terraform folder and file structure
-   State backend and locking configuration
-   GitHub OIDC role and permissions
-   Deployment process
-   Validation and troubleshooting notes
-   Screenshots or evidence of successful runs

## Learning Goal

Build and improve a Terraform-based AWS infrastructure project while
learning Infrastructure as Code, GitHub Actions, AWS IAM, secure
authentication, and CI/CD practices step by step.

