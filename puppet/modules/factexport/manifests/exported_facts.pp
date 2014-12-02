define factexport::exported_facts(
  $content,
  ) {
  file { "/tmp/factexport/${name}":
    content => $content,
  }
}
