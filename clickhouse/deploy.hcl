metadata {
  path = "clickhouse"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "clickhouse/terraform"
  target  = "clickhouse/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:S6YRXgVgpY/8SrBGQBDvIiuBaG04rkYZqAvtLJMbBzc="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "clickhouse/terraform"
  target  = "clickhouse/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:S6YRXgVgpY/8SrBGQBDvIiuBaG04rkYZqAvtLJMbBzc="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "clickhouse"
  target  = "clickhouse/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "clickhouse",
  ]

  sha     = "h1:S6YRXgVgpY/8SrBGQBDvIiuBaG04rkYZqAvtLJMbBzc="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "clickhouse"
  target  = "clickhouse/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "0771711b32c6ad5a1e3ff2e70b5c61578068ccb26b5c9f45d92fc4a08251eb6c"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "clickhouse"
  target  = "clickhouse/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "clickhouse",
  ]

  sha     = "h1:jOC09ZjBX9wkXWOxf6c+9Ba04eaWORy1a4RT2UmxbBQ="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "clickhouse"
  target  = "clickhouse/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "clickhouse",
  ]

  sha     = "h1:rE/r6XiZC+lJAex1oFBLz+EBeP+C2ftihu8GduPJU1E="
  retries = 2
  verbose = false
}
