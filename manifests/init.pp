class phpmyadmin () {
  # declare all parameterized classes
  class { phpmyadmin::params: }
  class { phpmyadmin::install: }
  class { phpmyadmin::config: }
  class { phpmyadmin::service: }

  # declare relationships
  Class['phpmyadmin::params'] -> 
  Class['phpmyadmin::install'] -> 
  Class['phpmyadmin::config'] -> 
  Class['phpmyadmin::service']
}

