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

  sha     = "315060674bc6d49eb2ed32de1f43a31848b20c3815f6253058b8aa3a03e511ca"
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

  sha     = "h1:bZGRjPUlFs6Rpe/bm9JqvvrtbkMNP1Lgmxte+tU5nqI="
  retries = 2
  verbose = false
}
