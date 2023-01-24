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

  sha     = "45f99b0b6b0723e325fb83fb5696d0f08958b125932ee82cb551ad1d45418ab9"
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

  sha     = "h1:eal2XRUhzZUHb+C0cRv1nHJLliWcFZk/3k6lmnxnvHM="
  retries = 0
  verbose = false
}
