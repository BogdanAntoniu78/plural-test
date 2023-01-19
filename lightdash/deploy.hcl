metadata {
  path = "lightdash"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "lightdash/terraform"
  target  = "lightdash/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:3aTpf0aHmTwHD5V1t3s5mlkprtMuJGFAdZpp9IF4eAc="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "lightdash/terraform"
  target  = "lightdash/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:3aTpf0aHmTwHD5V1t3s5mlkprtMuJGFAdZpp9IF4eAc="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "lightdash"
  target  = "lightdash/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "lightdash",
  ]

  sha     = "h1:3aTpf0aHmTwHD5V1t3s5mlkprtMuJGFAdZpp9IF4eAc="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "lightdash"
  target  = "lightdash/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "a9f517619685f6d21bead47058e20d8c2d8cd21009663edf5bb72db56ceb7833"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "lightdash"
  target  = "lightdash/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "lightdash",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "lightdash"
  target  = "lightdash/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "lightdash",
  ]

  sha     = "h1:xGBKHGkkNGUBZeDVpSIrk8/lR859AwIIYObHXOZSGog="
  retries = 2
  verbose = false
}
