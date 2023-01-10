metadata {
  path = "bytebase"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bytebase/terraform"
  target  = "bytebase/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "bytebase/terraform"
  target  = "bytebase/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "bytebase",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "bytebase"
  target  = "bytebase/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "bytebase",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "bytebase/helm"
  target  = "bytebase/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "bytebase",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
