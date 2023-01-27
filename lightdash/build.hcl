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

    sha     = "1ec36d42ccf47be75b46cd053083b2f6e5d533f09b47f923be1275a13002bf12"
    retries = 0
    verbose = false
  }
}
