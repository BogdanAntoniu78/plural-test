metadata {
  path = "calendso"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "calendso/terraform"
  target  = "calendso/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "calendso/terraform"
  target  = "calendso/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "calendso",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "calendso"
  target  = "calendso/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "calendso",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "calendso/helm"
  target  = "calendso/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "calendso",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
