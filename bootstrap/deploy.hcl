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

  sha     = "h1:mlcx/2nlgGgymKcjPSOqHCe+G68F4B/KgjGXdh9cXkY="
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

  sha     = "h1:mlcx/2nlgGgymKcjPSOqHCe+G68F4B/KgjGXdh9cXkY="
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

  sha     = "h1:mlcx/2nlgGgymKcjPSOqHCe+G68F4B/KgjGXdh9cXkY="
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

  sha     = "069f3a0c9c6a2e58e054cbc66264941bcf448277ce130e87e57db2bf64e8d32f"
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
