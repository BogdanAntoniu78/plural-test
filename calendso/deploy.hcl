metadata {
  path = "calendso"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "calendso/terraform"
  target  = "calendso/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:2loiEri0GU1dbB7Rpqi9HkLcjFmbTt+0JPNQRhgqhlM="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "calendso/terraform"
  target  = "calendso/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:2loiEri0GU1dbB7Rpqi9HkLcjFmbTt+0JPNQRhgqhlM="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "calendso"
  target  = "calendso/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "calendso",
  ]

  sha     = "h1:2loiEri0GU1dbB7Rpqi9HkLcjFmbTt+0JPNQRhgqhlM="
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
  ]

  sha     = "f5288f258466bc818b0dff49239ebe54b9c64e9fe3f645af7e9a5c8ade106484"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "calendso"
  target  = "calendso/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "calendso",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "calendso"
  target  = "calendso/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "calendso",
  ]

  sha     = "h1:pqy6dK+W11Dpp3pl+/QNlwUVXG0JkL9/3xTVBkzjEKI="
  retries = 2
  verbose = false
}
