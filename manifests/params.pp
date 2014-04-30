class phpmyadmin::params () {
	case $operatingsystem {
		/(Ubuntu|Debian)/: {
			$phpmyadmin_package_name   = 'phpmyadmin'
		}
		default: {
			fail("Module ${module_name} is not supported on ${operatingsystem}")
		}
	}
}

