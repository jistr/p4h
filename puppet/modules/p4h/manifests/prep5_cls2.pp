class p4h::prep5_cls2(
  $greeting = 'hello',
  $greeted  = 'world',
  ) {

  notify { "greeting":
    message => "$greeting $greeted",
  }

  file { '/root/greeting':
    content => "$greeting $greeted",
  }
}
