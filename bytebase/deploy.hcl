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

  sha     = "8cc7d5ccb9a46498e50ce6507745aa03baa36864d65d98b7118dd0a1ea511171"
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

  sha     = "h1:/QjIA/R2peNTLYxM3tJoELklCb2zHd3K+j6VifNimHo="
  retries = 2
  verbose = false
}
