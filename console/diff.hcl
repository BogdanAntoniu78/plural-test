metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:E5/4IqkuGN1Ho9dbSDqnq8+F59ASATeAdPpH4V22TBE="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:E5/4IqkuGN1Ho9dbSDqnq8+F59ASATeAdPpH4V22TBE="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha     = "a8716844f4dca87f657683562da4ec21ebd75e33fedaa190207a6d1cb4b3aaef"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:k4E6zNdV8nB9GKAo/aI1IMtjXcJ2t2RZgkiLdoeVIVo="
  retries = 0
  verbose = false
}
