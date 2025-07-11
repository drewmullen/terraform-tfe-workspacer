provider "tfe" {
  hostname = var.tfe_hostname
}

module "workspacer" {
  source = "../.."

  organization   = var.organization
  workspace_name = "workspacer-basic-example"
  workspace_desc = "Created by 'workspacer' Terraform module."
  workspace_map_tags = {
    "app"   = "acme",
    "env"   = "test",
    "cloud" = "aws"
  }
  project_name = "Default Project"

  tfvars = {
    example_var = "example_value"
  }

  tfvars_sensitive = {
    example_sensitive_var = "example_sensitive_value"
  }

  envvars = {
    AWS_ACCESS_KEY_ID = "TH1S1SNOTAREAL@CC3SSK3Y"
  }

  envvars_sensitive = {
    AWS_SECRET_ACCESS_KEY = "TH1S1$NOTAREALS3CR3TK3Y!"
  }

  team_access = {
    example-team-1 = "read"
    example-team-2 = "write"
  }
}