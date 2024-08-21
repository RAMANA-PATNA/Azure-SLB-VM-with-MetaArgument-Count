# Random resource
resource "random_string" "my_random" {
  length = 6
  numeric = false
  special = false
  upper = false
}