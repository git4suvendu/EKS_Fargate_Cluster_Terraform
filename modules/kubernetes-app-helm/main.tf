variable "game_app_chart_version" {
  default = "0.1.0"
}
variable "game_app_ingress_chart_version" {
  default = "0.1.0"
}

locals {
  game_app_helm_repo     = "https://github.com/git4suvendu/game-app/tree/master/helm"
  game_app_chart_name    = "game-app"
  game_app_chart_version = var.game_app_chart_version
  game_app_release_name = "game-app"


  game_app_ingress_release_name = "game-app-ingress"
  game_app_ingress_chart_name    = "game-app-ingress"
  game_app_ingress_chart_version = var.game_app_ingress_chart_version

}

resource "helm_release" "game_app" {

  name       = local.game_app_release_name
  repository = local.game_app_helm_repo
  chart      = local.game_app_chart_name
  version    = local.game_app_chart_version
#  namespace  = 'ns-fargate-app'
#  create_namespace = true
  atomic     = true
  timeout    = 900
  cleanup_on_fail = true
}


resource "helm_release" "game_app_ingress" {

  name       = local.game_app_ingress_release_name
  repository = local.game_app_helm_repo
  chart      = local.game_app_chart_name
  version    = local.game_app_chart_version
#  namespace  = 'ns-fargate-app'
#  create_namespace = true
  atomic     = true
  timeout    = 900
  cleanup_on_fail = true
}
