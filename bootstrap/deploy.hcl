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

  sha     = "h1:e/71d5D6X2lNHWFH2SoZGLSprTFJ1hzKv48GH3TCuuA="
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

  sha     = "h1:e/71d5D6X2lNHWFH2SoZGLSprTFJ1hzKv48GH3TCuuA="
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

  sha     = "h1:e/71d5D6X2lNHWFH2SoZGLSprTFJ1hzKv48GH3TCuuA="
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

  sha     = "a28662d35a796b070cf55549141f905306f7423ee083b3368b7d917b274d5736"
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
