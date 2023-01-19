metadata {
  name = "calendso"
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
  path = "helm/calendso"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "60638089bfcd4e5c6b53ba1f7a95874714331a94c36e56f77c9298b215d9c3a0"
    retries = 0
    verbose = false
  }
}
