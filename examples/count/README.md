# Example - Using the `count` Meta-Argument

```hcl
module "workspacer" {
  source  = "alexbasista/workspacer/tfe"
  version = "x.x.x"
  count   = 8

  organization   = "<my-org-name>"
  workspace_name = "workspacer-count-ex-${count.index}"
  workspace_map_tags = {
    "app" = "acme", 
    "env" = "test",
    "cloud" = "aws"
  }
  project_name   = "Default Project"
}
```