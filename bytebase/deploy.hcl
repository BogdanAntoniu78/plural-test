metadata {
  path = "bytebase"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bytebase/terraform"
  target  = "bytebase/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:sL4Sa+fHJIUtXlxg3JX6VbSOEnZ7NkrvlV6RhoRyfZM="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "bytebase/terraform"
  target  = "bytebase/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:sL4Sa+fHJIUtXlxg3JX6VbSOEnZ7NkrvlV6RhoRyfZM="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "bytebase"
  target  = "bytebase/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bytebase",
  ]

  sha     = "h1:sL4Sa+fHJIUtXlxg3JX6VbSOEnZ7NkrvlV6RhoRyfZM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "bytebase"
  target  = "bytebase/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "6da4ad234f3bf295d8fc1740ce69ead203bced77556608db832aa646dfc6e425"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "bytebase"
  target  = "bytebase/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bytebase",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "bytebase"
  target  = "bytebase/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bytebase",
  ]

  sha     = "h1:U9gTHyZ9CGrgL1AVKCebNKYwAqoW7D+f9PmpGph+Arw="
  retries = 2
  verbose = false
}
