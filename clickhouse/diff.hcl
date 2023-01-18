metadata {
  path = "clickhouse"
  name = "diff"
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

step "terraform" {
  wkdir   = "clickhouse/terraform"
  target  = "clickhouse/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "clickhouse",
  ]

  sha     = "a38c391457b10bf6a09cde7dacfbf38547cd132c50a5b08d2bcf31142287dd06"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "clickhouse/helm"
  target  = "clickhouse/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "clickhouse",
  ]

  sha     = "h1:BfG/NwzK1zuqId3SrU/Urq6F4nGzaOxo6TQ6FF/Fo1k="
  retries = 0
  verbose = false
}
