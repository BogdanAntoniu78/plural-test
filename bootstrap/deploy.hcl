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

  sha     = "h1:i8MwSwLxa8H5p/haoK/IqKUcl2WDpV1ykqXKE8AM+ag="
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

  sha     = "h1:i8MwSwLxa8H5p/haoK/IqKUcl2WDpV1ykqXKE8AM+ag="
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

  sha     = "h1:i8MwSwLxa8H5p/haoK/IqKUcl2WDpV1ykqXKE8AM+ag="
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

  sha     = "7bd9c896b5b624b7e24a1fd1b1705088827f4ace8ad2ea1b23f8c13ca7bcff67"
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

  sha     = "h1:F0sgOLI8LhxZ+iDRFAS9ZyUMbQP0Y3kAMsiY3yE0suU="
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

  sha     = "h1:sQo5Jbn2c0lg/2HSR1idUyujjjSz2zMmhUGno7iRRe0="
  retries = 2
  verbose = false
}
