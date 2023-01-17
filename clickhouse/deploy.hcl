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

  sha     = "1065b36c80a3a7e2308d791aa8e0318338e260835f23a857eaad26584420c3b5"
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

  sha     = "h1:/EdPknbxTwd8SFF7YZ3V69YOiPJFFWwb3kpHocjPs08="
  retries = 2
  verbose = false
}
