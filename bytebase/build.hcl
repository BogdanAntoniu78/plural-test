metadata {
  name = "bytebase"
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
  path = "helm/bytebase"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "b3472366f770926f586d01fa0138af4d12036e2df68df3e4d1584b1906b8a7e6"
    retries = 0
    verbose = false
  }
}
