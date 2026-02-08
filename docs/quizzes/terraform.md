# Terraform Quiz

<quiz>
What does `terraform init` do?

- [ ] Validates your configuration syntax
- [ ] Creates a new Terraform project from a template
- [x] Initializes the working directory and downloads required providers/modules
- [ ] Generates a plan of infrastructure changes

---

`terraform init` prepares the working directory by downloading provider plugins and modules specified in your configuration. It must be run before any other Terraform command in a new or cloned project.
</quiz>

<quiz>
Which of the following are valid top-level Terraform block types? (Select all that apply)

- [x] resource
- [x] data
- [ ] service
- [x] variable
- [x] output

---

`resource`, `data`, `variable`, and `output` are all valid top-level block types. `service` is not a Terraform concept — it's commonly used in Docker Compose or Kubernetes, which can be a tempting distractor.
</quiz>

<quiz>
The Terraform command to auto-format your `.tf` files is `terraform [[fmt]]`.

---

`terraform fmt` rewrites Terraform configuration files to a canonical format and style. It's commonly run before committing code.
</quiz>

<quiz>
What is the purpose of a Terraform state file?

- [ ] It stores your provider credentials securely
- [ ] It caches downloaded provider binaries
- [x] It maps your configuration to real-world resources so Terraform can track what it manages
- [ ] It logs the history of all `terraform apply` runs

---

The state file (`terraform.tfstate`) is Terraform's source of truth for what infrastructure it manages. It maps resource addresses in your config to actual resource IDs in your cloud provider, enabling Terraform to detect drift and plan changes.
</quiz>

<quiz>
You want to reference a variable named `region` inside a resource block. The correct syntax is `[[var.region]]`.

---

Terraform variables are referenced using the `var.<name>` prefix. For example, `var.region` accesses the value of a variable block named `region`.
</quiz>

<quiz>
What happens if you run `terraform apply` without first running `terraform plan`?

- [ ] It fails with an error
- [ ] It only validates the configuration
- [x] It generates a plan and then prompts you to approve it before applying
- [ ] It applies changes without any confirmation

---

Running `terraform apply` without a saved plan will automatically generate a new plan and present it for approval. Terraform always shows you what it intends to do before making changes (unless you pass `-auto-approve`).
</quiz>

<quiz>
Which of the following are stored in the Terraform state file? (Select all that apply)

- [x] Resource IDs from the cloud provider
- [x] Resource attributes like IP addresses and ARNs
- [ ] Your provider authentication credentials
- [x] Dependency relationships between resources
- [ ] The full text of your `.tf` configuration files

---

The state file stores resource metadata including cloud provider IDs, computed attributes, and dependency information. It does **not** store credentials or your source configuration files.
</quiz>

<quiz>
What is the correct order of a typical Terraform workflow?

- [ ] plan → init → validate → apply
- [x] init → validate → plan → apply
- [ ] validate → init → apply → plan
- [ ] init → apply → plan → validate

---

The standard workflow is: `init` (set up workspace) → `validate` (check syntax) → `plan` (preview changes) → `apply` (execute changes). You must always initialize before any other operations.
</quiz>

<quiz>
A `data` block in Terraform is used to:

- [ ] Define a new infrastructure resource to create
- [x] Query existing resources or external information without managing them
- [ ] Store sensitive values like passwords
- [ ] Define reusable configuration templates

---

Data sources (`data` blocks) let you fetch information about existing infrastructure that Terraform doesn't manage, or query provider APIs for information like AMI IDs or availability zones. Unlike `resource` blocks, they don't create or manage anything.
</quiz>

<quiz>
The file conventionally used to define input variables in a Terraform project is called [[variables.tf]].

---

By convention, input variable declarations go in `variables.tf`, though Terraform loads all `.tf` files in a directory regardless of name. Following this convention makes projects easier to navigate.
</quiz>

<quiz>
What does `terraform destroy` do?

- [ ] Deletes the state file
- [ ] Removes the `.terraform` directory
- [x] Destroys all resources managed by the current Terraform state
- [ ] Reverts the last `terraform apply`

---

`terraform destroy` terminates and removes all infrastructure resources tracked in the state file. It's the inverse of `terraform apply` — it plans the destruction of every managed resource and prompts for confirmation.
</quiz>

<quiz>
Which of the following are benefits of Infrastructure as Code with Terraform? (Select all that apply)

- [x] Infrastructure changes are versioned and reviewable in source control
- [x] Configuration can be reused across environments
- [ ] Terraform automatically fixes misconfigured resources at runtime
- [x] Infrastructure can be reproduced consistently
- [ ] Terraform replaces the need for cloud provider APIs entirely

---

IaC with Terraform provides version control, reusability, and reproducibility. However, Terraform does not monitor or auto-fix resources at runtime (it's declarative, not a control plane), and it works *through* cloud provider APIs, not as a replacement for them.
</quiz>

<quiz>
You reference an attribute of a resource with address `aws_instance.web`. To get its public IP, you would write `[[aws_instance.web.public_ip]]`.

---

Resource attributes are accessed using the pattern `<resource_type>.<resource_name>.<attribute>`. For an AWS instance, `public_ip` is a computed attribute available after the resource is created.
</quiz>

<quiz>
What is a Terraform provider?

- [ ] A cloud account where resources are deployed
- [ ] A Terraform module published to the registry
- [x] A plugin that enables Terraform to interact with a specific platform or service API
- [ ] A file that stores Terraform state remotely

---

Providers are plugins that teach Terraform how to talk to specific APIs — AWS, Azure, GCP, GitHub, Kubernetes, etc. Each provider offers resource types and data sources for its platform. They're downloaded during `terraform init`.
</quiz>

<quiz>
What flag can you pass to `terraform plan` to supply a variable value from the command line?

- [ ] `--set`
- [x] `-var`
- [ ] `--variable`
- [ ] `-input`

---

The `-var` flag lets you set individual variable values on the command line, e.g., `terraform plan -var="region=us-west-2"`. You can also use `-var-file` to load variables from a file.
</quiz>

<quiz>
Which of the following should typically be added to `.gitignore` in a Terraform project? (Select all that apply)

- [x] `*.tfstate`
- [x] `.terraform/`
- [ ] `*.tf`
- [x] `*.tfstate.backup`
- [ ] `variables.tf`

---

State files (`*.tfstate`, `*.tfstate.backup`) contain sensitive data and should not be committed. The `.terraform/` directory contains downloaded providers and modules (like `node_modules/`). Your `.tf` configuration files **should** be committed — they are your source of truth.
</quiz>

<quiz>
What is a Terraform module?

- [ ] A single `.tf` file
- [ ] A Terraform provider for a specific cloud
- [x] A reusable, self-contained package of Terraform configuration
- [ ] A way to run Terraform in CI/CD pipelines

---

A module is a container for multiple resources that are used together. Any directory with `.tf` files is technically a module (the "root module"). Modules can be sourced from local paths, the Terraform Registry, or Git repositories, and are referenced with `module.<name>`.
</quiz>

<quiz>
Terraform uses a [[declarative]] language model, meaning you describe the desired end state rather than the steps to reach it.

---

Terraform's HCL (HashiCorp Configuration Language) is declarative: you specify *what* your infrastructure should look like, and Terraform figures out *how* to get there. This contrasts with imperative approaches where you write step-by-step instructions.
</quiz>

<quiz>
What does `terraform validate` check?

- [x] Whether the configuration files are syntactically valid and internally consistent
- [ ] Whether the cloud credentials are correct
- [ ] Whether the planned changes are safe to apply
- [ ] Whether the state file matches actual infrastructure

---

`terraform validate` checks your configuration for syntax errors, invalid references, and type mismatches — all without accessing any remote services or state. It does not verify credentials or check for drift.
</quiz>

<quiz>
You want to view the current resources tracked in your Terraform state. Which command lists them?

- [ ] `terraform show --list`
- [ ] `terraform resources`
- [x] `terraform state list`
- [ ] `terraform status`

---

`terraform state list` outputs all resource addresses currently tracked in the state file. For detailed information about a specific resource, you can use `terraform state show <address>` or `terraform show` for the full state.
</quiz>

<quiz>
By convention, provider configuration and primary infrastructure definitions belong in which file?

- [ ] `terraform.tf` only
- [ ] `providers.tf` only
- [x] Provider config in `terraform.tf`, primary infrastructure in `main.tf`
- [ ] Everything in a single `config.tf`

---

The conventional file layout puts Terraform settings and required providers in `terraform.tf`, primary resource and provider blocks in `main.tf`, variables in `variables.tf`, and outputs in `outputs.tf`. Terraform loads all `.tf` files, but following conventions improves readability.
</quiz>
