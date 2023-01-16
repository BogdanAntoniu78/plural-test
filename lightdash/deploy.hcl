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

  sha     = "ab9fe6e293162d499cfb96a6df69f1f05406772360e808f8aadd631a1d5877f7"
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

  sha     = "h1:hZlHWIV5x3C4a33IAOlbojVmZjF5ayTevacNImzU+8U="
  retries = 2
  verbose = false
}
