metadata {
  path = "monitoring"
  name = "deploy"
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

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:w3/5ufaPSUaM39GSzmYZikzkED0xTw/v/BtmXokQ5CE="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "2d3b2e5004a4b06c4107e5dc97cff42d7b63a417439b579ddca3a1fe4d23461d"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha     = "h1:QJzNafRcIWRU2+sMuD3q9AEYu0g850LEi1jTrT1fjAM="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha     = "h1:O7/06xW3Ve1HaR7R/1ShrveJRfQ7BkxcVT5Kkw8rTu4="
  retries = 2
  verbose = false
}
