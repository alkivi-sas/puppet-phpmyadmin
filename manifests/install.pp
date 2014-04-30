class phpmyadmin::install () {
  mysql::database{ 'phpmyadmin':
    user    => 'phpmyadmin',
    require => Class['mysql'],
  }

  if ! defined(File['/root/preseed/'])
  {
    file { '/root/preseed':
      ensure     => directory,
      mode => '0750',
    }
  }

  $phpmyadmin_password = alkivi_password('phpmyadmin', 'db')
  $admin_password = alkivi_password('mysql', 'db')

  file { '/root/preseed/phpmyadmin.preseed':
    content => template('phpmyadmin/preseed.erb'),
    mode    => '0600',
    backup  => false,
    require => File['/root/preseed'],
  }

  package { $phpmyadmin::params::phpmyadmin_package_name:
    ensure       => installed,
    responsefile => '/root/preseed/phpmyadmin.preseed',
    require      => [Mysql::Database['phpmyadmin'], File['/root/preseed/phpmyadmin.preseed'] ],
  }
}
