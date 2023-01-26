metadata {
  path = "monitoring"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:w3/5ufaPSUaM39GSzmYZikzkED0xTw/v/BtmXokQ5CE="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "monitoring",
  ]

  sha     = "h1:w3/5ufaPSUaM39GSzmYZikzkED0xTw/v/BtmXokQ5CE="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "monitoring",
  ]

  sha     = "2b4a70cf1fd4de4ab8b6c4efbcaa71f8be811825146f631677d0a8945bae194b"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "monitoring/helm"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "monitoring",
  ]

  sha     = "h1:95afGKFgWbFtbVWUaR3eUQbR6hd14exBeH1mxvVBXPY="
  retries = 0
  verbose = false
}
