class factexport() {
  @@exported_facts { "$::fqdn":
    content => $::factexport_local_yaml,
  }

  Exported_facts<<||>> {
  }
}
