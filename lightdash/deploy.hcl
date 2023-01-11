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

  sha     = "578e7ae500cab7655ccbc53fa11adc89c406b418d265d9163df9b7b8374385ed"
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

  sha     = "h1:gJJuF/nCsMNsFxIjB7UEJXRI9BSZx67ss/CjflDtZVc="
  retries = 2
  verbose = false
}
