provider "tfe" {
  hostname = "app.terraform.io"
}

module "workspacer_vcs_oauth_token" {
  source  = "alexbasista/workspacer/tfe"
  version = "0.13.0"

  organization   = "<my-org-name>"
  workspace_name = "workspacer-vcs-oauth-ex"
  workspace_map_tags = {
    "app"   = "acme",
    "env"   = "test",
    "cloud" = "aws"
  }
  project_name = "Default Project"

  working_directory     = "</example/tf/directory>"
  auto_apply            = true
  file_triggers_enabled = true
  trigger_patterns      = ["</example/tf/directory/**/*>"]
  queue_all_runs        = true

  vcs_repo = {
    identifier         = "<vcs-organization>/<terraform-repo-name>"
    branch             = "main"
    oauth_token_id     = "<ot-abcdefg123456789>"
    ingress_submodules = false
    tags_regex         = null
  }
}

module "workspacer_vcs_github_app" {
  source  = "alexbasista/workspacer/tfe"
  version = "0.13.0"

  organization   = "<my-org-name>"
  workspace_name = "workspacer-vcs-github-app-ex"
  workspace_map_tags = {
    "app"   = "acme",
    "env"   = "test",
    "cloud" = "aws"
  }
  project_name = "Default Project"

  working_directory     = "/example/tf/directory"
  auto_apply            = false
  file_triggers_enabled = true
  trigger_patterns      = ["</example/tf/directory/**/*>"]
  queue_all_runs        = true

  vcs_repo = {
    identifier                 = "<vcs-organization>/<terraform-repo-name>"
    branch                     = "main"
    github_app_installation_id = "<ghain-abcdefg123456789>"
    ingress_submodules         = false
    tags_regex                 = null
  }
}
