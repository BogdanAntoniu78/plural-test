metadata {
  path = "postgres"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:4NWqJ/liyzT5StPqiqeqb0e6vN0v7GVj0TQwMv2z22Q="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "postgres",
  ]

  sha     = "h1:4NWqJ/liyzT5StPqiqeqb0e6vN0v7GVj0TQwMv2z22Q="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "postgres"
  target  = "postgres/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "postgres",
  ]

  sha     = "6945a7a9a369b5e7d13eea1260c185a97e87f656a4e4502aa30ac187a589a5ec"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "postgres/helm"
  target  = "postgres/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "postgres",
  ]

  sha     = "h1:dXwYc1M9fCtvLGj0r/85FIMKtcnSURZkke97aMAppk0="
  retries = 0
  verbose = false
}
