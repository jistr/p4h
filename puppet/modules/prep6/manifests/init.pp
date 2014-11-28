class prep6 {
  if template('prep6/yesno.erb') =~ /yes/ {
    notify { 'yes': }
  }
}
