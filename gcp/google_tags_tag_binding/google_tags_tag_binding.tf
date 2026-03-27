resource "google_tags_tag_binding" "this" {
  parent    = var.parent
  tag_value = var.tag_value

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
