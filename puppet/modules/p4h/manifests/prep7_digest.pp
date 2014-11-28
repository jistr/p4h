define p4h::prep7_digest() {

  # won't really do much though
  require p4h

  notify { "digesting $title nom nom nom": }
  ->
  file { "/root/${title}_after_digestion.txt":
    content => inline_template("<% require 'digest' %><%= Digest::MD5.hexdigest(@title) %>"),
  }

}
