metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:ZwCsIo4Ernx7Q2a4pRhhmyxHhEk5ssDP+Mq1o6/i7xE="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:ZwCsIo4Ernx7Q2a4pRhhmyxHhEk5ssDP+Mq1o6/i7xE="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha     = "h1:ZwCsIo4Ernx7Q2a4pRhhmyxHhEk5ssDP+Mq1o6/i7xE="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "ad78689e91cb84a12d478a374a7fbcd98cbc41d9b5719bf6be0fa5c5c14b3d32"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha     = "h1:0XX5H0rv3wG6w0R1/ZrVgteTzxK/EbokqGPX3Uj6CNI="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha     = "h1:QsCIUmYpNCSsb/Tp7XtlhkdkYanG0gmAZqQAN6nhIKc="
  retries = 2
  verbose = false
}
