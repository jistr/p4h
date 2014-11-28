define p4h::prep7_hello(
  $greeting = 'hello',
  ) {

  $message = "$greeting $title"

  file { "/root/say_hello_to_$title.txt":
    content => $message,
  }
}
