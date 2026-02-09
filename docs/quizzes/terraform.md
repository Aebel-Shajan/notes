# Terraform Quiz

<quiz>
What does `terraform init` do?

- [ ] Creates cloud resources defined in your configuration
- [x] Initializes the working directory and downloads required providers
- [ ] Validates your configuration files for syntax errors
- [ ] Generates an execution plan for review

---

`terraform init` sets up the working directory, downloads provider plugins, and initializes the backend. It must be run before any other Terraform command in a new workspace.
</quiz>

<quiz>
The Terraform command to auto-format your `.tf` files to canonical style is `terraform` [[fmt]].

---

`terraform fmt` rewrites Terraform configuration files to a consistent format and style. It's commonly run before committing code.
</quiz>

<quiz>
Which of the following are valid Terraform block types? (Select all that apply)

- [x] resource
- [x] data
- [ ] service
- [x] module
- [ ] endpoint

---

`resource`, `data`, and `module` are all valid top-level Terraform block types. `service` and `endpoint` are not part of Terraform's language specification.
</quiz>

<quiz>
What is the correct order of the core Terraform workflow?

- [ ] plan → init → validate → apply → destroy
- [ ] validate → plan → init → apply → destroy
- [x] init → validate → plan → apply → destroy
- [ ] init → plan → validate → apply → destroy

---

The standard workflow is: `init` (set up workspace) → `validate` (check syntax) → `plan` (preview changes) → `apply` (create/update resources) → `destroy` (tear down resources).
</quiz>

<quiz>
In Terraform, how do you reference a variable named `instance_type` inside a configuration block?

- [ ] `${instance_type}`
- [x] `var.instance_type`
- [ ] `variable.instance_type`
- [ ] `tf.instance_type`

---

Variables are referenced using the `var.` prefix, e.g. `var.instance_type`. The `${...}` interpolation syntax is only needed inside quoted strings, and even then you'd write `"${var.instance_type}"`.
</quiz>

<quiz>
What is the purpose of a `data` block in Terraform?

- [ ] To define new infrastructure resources to create
- [ ] To store output values for other modules
- [x] To query existing resources or information from a provider
- [ ] To declare input variables for the configuration

---

A `data` block (data source) lets you fetch information about existing infrastructure or external data that Terraform doesn't manage, such as looking up an AMI ID or reading a DNS zone.
</quiz>

<quiz>
The file where you would conventionally store your variable declarations is called [[variables.tf]].

---

By convention, variable blocks are placed in `variables.tf`. While Terraform loads all `.tf` files in a directory regardless of name, following this convention makes projects easier to navigate.
</quiz>

<quiz>
What does `terraform plan` do?

- [ ] Applies all pending changes to infrastructure
- [ ] Initializes the workspace and downloads plugins
- [x] Shows a preview of what changes Terraform will make without applying them
- [ ] Validates that the configuration syntax is correct

---

`terraform plan` creates an execution plan showing what actions Terraform would take to reach the desired state. It does not make any actual changes — it's a dry run.
</quiz>

<quiz>
Which of the following are stored in the Terraform state file? (Select all that apply)

- [x] Resource IDs and metadata from the cloud provider
- [x] Mappings between resource addresses and real infrastructure
- [ ] Your `.tf` source code
- [x] Dependency relationships between resources
- [ ] Provider plugin binaries

---

The state file tracks resource metadata, real-world IDs, dependency info, and attribute values. It does not contain source code or provider binaries.
</quiz>

<quiz>
What is the unique identifier for a resource in Terraform configuration?

- [ ] Just the resource name (e.g., `my_instance`)
- [ ] Just the resource type (e.g., `aws_instance`)
- [x] The combination of resource type and name (e.g., `aws_instance.my_instance`)
- [ ] The provider name plus the resource name

---

A resource's address is `resource_type.resource_name`, for example `aws_instance.my_instance`. This combination must be unique within a module.
</quiz>

<quiz>
You can pass a variable value at the command line during `terraform plan` using the [[`-var`]] flag.

---

The `-var` flag lets you set variable values on the command line, e.g. `terraform plan -var="instance_type=t2.micro"`. You can also use `-var-file` to load from a file.
</quiz>

<quiz>
What does Terraform use providers for?

- [ ] To store the state file remotely
- [ ] To format and validate configuration files
- [x] To interact with cloud platforms and other APIs by translating resource definitions into API calls
- [ ] To manage Terraform module dependencies

---

Providers are plugins that let Terraform interact with specific platforms (AWS, Azure, GCP, etc.). Each provider offers resource types and data sources for its platform.
</quiz>

<quiz>
Which of the following statements about Terraform are true? (Select all that apply)

- [x] Terraform uses a declarative language — you describe the desired end state
- [ ] Terraform executes changes imperatively in the order you write them
- [x] Terraform can manage infrastructure across multiple cloud providers
- [x] Terraform tracks infrastructure with a state file
- [ ] Terraform directly SSHs into servers to configure them

---

Terraform is declarative (you describe *what* you want, not *how*), supports multiple providers, and uses a state file. It does not SSH into servers — that's configuration management tools like Ansible.
</quiz>

<quiz>
What happens if you run `terraform apply` without running `terraform init` first?

- [ ] Terraform automatically runs init for you
- [ ] Terraform applies using cached providers from a previous run
- [x] Terraform fails with an error because the workspace is not initialized
- [ ] Terraform creates resources but skips provider validation

---

`terraform init` must be run before any other command. Without it, Terraform has no provider plugins downloaded and no backend configured, so `apply` will fail.
</quiz>

<quiz>
A reusable collection of Terraform resources that can be called from other configurations is known as a [[module]].

---

Modules are self-contained packages of Terraform configuration that can be reused across projects. You reference them with `module` blocks and access their outputs with `module.<name>.<output>`.
</quiz>

<quiz>
Where should provider configuration blocks conventionally be placed?

- [x] In `main.tf` (or `terraform.tf` for the required_providers block)
- [ ] In `providers.tf` only — never in main.tf
- [ ] In `variables.tf` alongside variable declarations
- [ ] In a separate `config/` subdirectory

---

By convention, provider blocks go in `main.tf` and the `required_providers` block goes inside the `terraform` block in `terraform.tf`. While Terraform doesn't enforce filenames, this is the standard practice.
</quiz>

<quiz>
What is the purpose of `terraform validate`?

- [ ] It checks that your cloud credentials are valid
- [ ] It verifies that the state file matches real infrastructure
- [x] It checks configuration files for syntax errors and internal consistency
- [ ] It runs a plan and confirms the changes are safe

---

`terraform validate` checks your `.tf` files for syntax correctness and internal consistency (e.g., correct attribute names, valid references). It does not contact any remote APIs or validate credentials.
</quiz>

<quiz>
Which of the following are common reasons to use `terraform destroy`? (Select all that apply)

- [x] Tearing down a development or testing environment
- [x] Removing all resources managed by a configuration before decommissioning
- [ ] Rolling back a failed apply to the previous state
- [ ] Refreshing the state file to match real infrastructure

---

`terraform destroy` removes all resources managed by the configuration. It's commonly used for temporary environments. It does not "roll back" changes (use state manipulation or revert code for that) and `terraform refresh` handles state syncing.
</quiz>

<quiz>
How do you access an attribute of a resource named `aws_instance.web` in another part of your configuration?

- [ ] `resource.aws_instance.web.public_ip`
- [x] `aws_instance.web.public_ip`
- [ ] `ref.aws_instance.web.public_ip`
- [ ] `get(aws_instance.web, "public_ip")`

---

You reference resource attributes directly using `resource_type.resource_name.attribute`, e.g. `aws_instance.web.public_ip`. No `resource.` prefix or function call is needed.
</quiz>

<quiz>
The command to list all resources currently tracked in your Terraform state is `terraform` [[state list]].

---

`terraform state list` displays all resource addresses in the current state file. It's useful for inspecting what Terraform is managing without looking at the raw state JSON.
</quiz>

<quiz>
What best describes Terraform's relationship with runtime infrastructure control?

- [ ] Terraform excels at both provisioning and runtime orchestration
- [x] Terraform is excellent at bring-up but not suited for runtime orchestration
- [ ] Terraform can dynamically scale resources in real time based on load
- [ ] Terraform replaces the need for any control plane tooling

---

Terraform's model is "desired end state, not live control." It's excellent for provisioning and managing infrastructure configuration, but runtime orchestration (scaling, failover, service mesh routing) belongs to control-plane tools like Kubernetes, auto-scaling groups, or service meshes.
</quiz>
