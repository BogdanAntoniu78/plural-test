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

  sha     = "h1:QAK0ybSivC63qLZtIL4pGzrjNxXPFsvJZZ/F9MmE9bE="
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

  sha     = "h1:QAK0ybSivC63qLZtIL4pGzrjNxXPFsvJZZ/F9MmE9bE="
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

  sha     = "h1:QAK0ybSivC63qLZtIL4pGzrjNxXPFsvJZZ/F9MmE9bE="
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

  sha     = "845eeea89e6b6be26b4315a2ad3017b98b6ad47e3fc2b32da4f2a225deb1c18d"
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
