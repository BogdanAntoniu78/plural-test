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

    sha     = "7ed7e60e8802e65cb8e731ab634c4d780c7f9a181053b15a9413061005e7c297"
    retries = 0
    verbose = false
  }
}
