# Workspace runner

Place this folder beside the seven existing Terraform directories. No AWS resources or target state files are moved into this folder.

## Preparation

1. Create an HCP workspace named `workspace-runner-ws` in `hc-team`. Under Settings > General explicitly set Execution Mode to **Local**. Do this before running the controller. Its state is stored in HCP; only its TFE API orchestration executes on your laptop. Target workspaces remain Remote.
2. Confirm the seven actual HCP workspace names in `variables.tf`. The local `be-network-ns` directory can map to HCP `be-network-ws`; these names need not match. Change both the cloud block and organization variable if your organization is different.
3. Authenticate locally with `terraform login`, or set TFE_TOKEN locally to an HCP API token with permissions to read the target workspaces and queue/apply/destroy runs. Local execution does not inject HCP workspace variables into your local process. Never commit tokens.
4. Ensure every target has a usable, current configuration version (uploaded for CLI-driven workspaces or available via its VCS workflow), correct AWS credentials, output-reading permissions, and destroy plans enabled. The runner does not upload files from the seven local directories. Existing remote workspace locks or pending approvals must be resolved normally.
5. Avoid simultaneous VCS/run-trigger execution that duplicates the controller's initial runs. In particular, disable creation run triggers while tearing down.

## Initial creation

```sh
cd workspace-runner-ws
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

The initial apply automatically approves target applies (`manual_confirm = false`) and waits for completion. Existing infrastructure is retained or changed according to each target's own plan. Adding these resources queues runs even if the targets have previously applied. An unchanged later controller apply does not rerun them.

Keep the generated `.terraform.lock.hcl` under version control.

## Order

Two chains can run concurrently:

- be-network-ws -> be-security-ws -> be-compute-ws
- fe-network-ws -> fe-security-ws -> fe-compute-ws

Peering runs after both compute runs succeed. This follows the supplied diagram; the lower row is interpreted as frontend. If compute provisioning itself needs peering, change the graph accordingly; do not add a circular dependency.

## Teardown

Preview first:

```sh
terraform plan -destroy
```

When you intend to destroy the target infrastructure:

```sh
terraform destroy
```

This destroys resources in all seven target workspaces, beginning with peering, then compute, security, and networks. The target workspaces themselves are retained because this configuration reads them through data sources. Destroying/removing/replacing a tfe_workspace_run that has a destroy block can destroy its target infrastructure; do not replace one merely to rerun an apply.

Keep this controller's state until teardown succeeds. Target AWS and HCP output-reading credentials must remain available throughout destruction. Existing network route ownership must be consistent (do not manage the same routes both inline and in a separate workspace).

## References

- https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace_run
- https://www.hashicorp.com/en/blog/terraform-apply-as-code-the-multispace-pattern
