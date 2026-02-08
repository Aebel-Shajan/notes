# Terraform

## Overview
* terraform config
* providers 
* resources
* terraform state
* variables
* init -> validate -> plan -> apply -> destroy

## links
* tutorials: 
    * https://developer.hashicorp.com/terraform/intro
    * https://developer.hashicorp.com/terraform/tutorials/aws-get-started/infrastructure-as-code
    * https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-create
    * https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-manage
* vscode extension: https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform

## Reference
* commands:
    * `terraform fmt` : format code
    * `terraform init` : init workspace (installs prodiers in terraform dir)
    * `terraform apply`
    * `terraform destroy`
    * `terraform validate` : validate tf files
    * `terraform.tf_state`
    * `terraform state list` : list current state
    * `terraform show` 
    * `terraform plan`: (can use vars with `-var`)
* blocks:
    * `terraform`: terraform config
    * `provider`: provider config
    * `data` : query cloud provider for information about other resources
    * `resource`: components of infrastructure
    * `module` : reusable sets of configuration
* folder structure:
    * `terraform.tf` : terraform config
    * `main.tf`: provider blocks and other primary infrastructure in main.tf as a best practice
    * `variables.tf` : store variable blocks
    * `outputs.tf`: access terraform config attributes with other automation tools or workflows.


* registry: https://registry.terraform.io/providers/hashicorp/aws/6.22.1/docs?utm_content=documentHover&utm_medium=Visual+Studio+Code&utm_source=terraform-ls
* gitignore: https://developer.hashicorp.com/terraform/language/style#gitignore

## IaC with Terraform
* manage infastructure as code instead of from ui
* works on multiple cloud platforms
* terraform states -> track resources with state
* terraform providers -> plugins for each cloud provider. 
* combine resources into module
* declarative language: describes end state of infrastructure

* steps:
    * scope
    * author
    * initialize
    * plan
    * apply

* state file to keep track of current state

## terraform aws get started
* Configure your provider in `terraform.tf`
* Configure everything else in `main.tf`
* Each provider block configures each provider
* data sources to query cloud provdier about more information about resources
* resource block cmoponent of infra -> docs in registration
* resource type + resource_name = resource address
* use `resource_type.resource_name.` to access resource
* (AMI: amazon machine images)
* variable: parametrize the behavior of your Terraform configuration
* use `var.` to refer to variables
* modules: reusable collection of resources, `module.` to refer to module.


## adhoc
* Terraform’s model is:
    > “Desired end state, not live control.”
* You’re thinking:

    > “Terraform is how I change infra, so I’ll just change a variable”

    * That instinct is correct for creation, wrong for control.

    * Terraform is:

        * excellent at bring-up

        * terrible at runtime orchestration

    * This is a classic infra vs control-plane split.