class kapacitor (
    String $package_source = 'default',
) inherits kapacitor::params {

    case $package_source {
        default: {
            package { $package_name:
                ensure => installed,
            }
        }
        'web': {
            ensure_packages(['wget'])

            exec { 'Download Kapacitor Package':
                command => "wget ${package_url} -P /tmp",
                creates => "/tmp/${source}",
                path    => '/usr/local/bin/:/bin/',
                require => Package['wget'],
            }

            package { $package_name:
                ensure   => installed,
                provider => $provider,
                require  => Exec['Download Kapacitor Package'],
                source   => "/tmp/${source}",
            }
        }
    }

    #file { $config_file:
    #    ensure  => present,
    #    content => epp("${module_name}${config_file}.epp"),
    #    require => Package[$package_name],
    #}

    service { $package_name:
        ensure    => running,
        enable    => true,
        require   => Package[$package_name],
        #subscribe => File[$config_file],
    }

}
