class kapacitor::params {

    $package_location = 'https://s3.amazonaws.com/influxdb'
    $package_name     = 'kapacitor'
    $package_version  = '0.2.0'

    case $::osfamily {
        default: {
            fail("${::osfamily} is not supported.")
        }
        'Debian': {
            $provider = 'deb'
            $source   = "${package_name}_${package_version}_amd64.deb"
        }
        'RedHat': {
            $provider = 'rpm'
            $source   = "${package_name}-${package_version}-1.x86_64.rpm"

        }
    }

    #$config_file = '/opt/chronograf/config.toml'
    $package_url = "${package_location}/${source}"

}
