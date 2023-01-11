metadata {
  name = "lightdash"
}

scaffold "terraform" {
  path = "terraform"
  type = "terraform"
}

scaffold "crds" {
  path = "crds"
  type = "crd"
}

scaffold "helm" {
  path = "helm/lightdash"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "4d3b2ae4f85925b4d650a6f702962964708af97047f21370fa375849b57c1195"
    retries = 0
    verbose = false
  }
}
