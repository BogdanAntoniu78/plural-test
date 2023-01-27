metadata {
  path = "monitoring"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
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

  sha     = "2d3b2e5004a4b06c4107e5dc97cff42d7b63a417439b579ddca3a1fe4d23461d"
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

  sha     = "h1:O7/06xW3Ve1HaR7R/1ShrveJRfQ7BkxcVT5Kkw8rTu4="
  retries = 0
  verbose = false
}
