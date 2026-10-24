# Initial applies run forward; final destroys run in reverse dependency order.

resource "tfe_workspace_run" "be_network" {
  workspace_id = data.tfe_workspace.target["be_network"].id

  apply {
    manual_confirm = false
    wait_for_run   = true
  }

  destroy {
    manual_confirm = false
    wait_for_run   = true
  }
}

resource "tfe_workspace_run" "be_security" {
  workspace_id = data.tfe_workspace.target["be_security"].id

  depends_on = [
    tfe_workspace_run.be_network,
  ]

  apply {
    manual_confirm = false
    wait_for_run   = true
  }

  destroy {
    manual_confirm = false
    wait_for_run   = true
  }
}

resource "tfe_workspace_run" "be_compute" {
  workspace_id = data.tfe_workspace.target["be_compute"].id

  depends_on = [
    tfe_workspace_run.be_security,
  ]

  apply {
    manual_confirm = false
    wait_for_run   = true
  }

  destroy {
    manual_confirm = false
    wait_for_run   = true
  }
}

resource "tfe_workspace_run" "fe_network" {
  workspace_id = data.tfe_workspace.target["fe_network"].id

  apply {
    manual_confirm = false
    wait_for_run   = true
  }

  destroy {
    manual_confirm = false
    wait_for_run   = true
  }
}

resource "tfe_workspace_run" "fe_security" {
  workspace_id = data.tfe_workspace.target["fe_security"].id

  depends_on = [
    tfe_workspace_run.fe_network,
  ]

  apply {
    manual_confirm = false
    wait_for_run   = true
  }

  destroy {
    manual_confirm = false
    wait_for_run   = true
  }
}

resource "tfe_workspace_run" "fe_compute" {
  workspace_id = data.tfe_workspace.target["fe_compute"].id

  depends_on = [
    tfe_workspace_run.fe_security,
  ]

  apply {
    manual_confirm = false
    wait_for_run   = true
  }

  destroy {
    manual_confirm = false
    wait_for_run   = true
  }
}

resource "tfe_workspace_run" "peering" {
  workspace_id = data.tfe_workspace.target["peering"].id

  depends_on = [
    tfe_workspace_run.be_compute,
    tfe_workspace_run.fe_compute,
  ]

  apply {
    manual_confirm = false
    wait_for_run   = true
  }

  destroy {
    manual_confirm = false
    wait_for_run   = true
  }
}
