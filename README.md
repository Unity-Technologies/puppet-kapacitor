# kapacitor

## Module Description

[Kapacitor](https://influxdata.com/time-series-platform/kapacitor) is a data processing engine. It can process both stream (subscribe realtime) and batch (bulk query) data from InfluxDB. Kapacitor lets you define custom logic to process alerts with dynamic thresholds, match metrics for patterns, compute statistical anomalies, etc. This module installs Kapacitor and provides the ability to customise the configuration. This module aims to be generic and simple.

## Setup

*What the kapacitor Puppet module affects:*

* Package installation
* Service management
* Configuration files

## Usage

```
include kapacitor
```

This will simply call the package as a standard resource and thus assumes you have configured a repository that contains the package, be it your own or a third party. For most production environments this assumption should be appropriate as external access is often restricted.

If you do not have such restrictions and do not want to configure a repository you can simply request that the package be fetched from the internet:

```
class { 'kapacitor':
    package_source => 'web',
}
```

### Hiera Support

It is recommended that Hiera is used, but not required. Below is an example configuration:

*site.pp*

```
hiera_include('classes', [])
```

*mynode.example.org.yaml*

```
clases:
    - kapacitor

kapacitor::package_source: web
```

## Reference

### Classes

Class: `kapacitor`

Guides the basic setup and installation of kapacitor on your system.

When this class is declared with the default options, Puppet:

* Installs the appropriate Kapacitor software package for your operating system (assumes you have a repository configured).
* Places the required configuration files in a directory, with the default location determined by your operating system.
* Starts the Kapacitor service.

*Paramters within `kapacitor`:*

`package_source`
Determines how to install the package. Valid options: undef, 'web'. Default: undef

## Limitations

### Puppet Future Parser

This module is written using features that are found in the future parser and is not backwards compatible.

## Development

### Contributing

Please feel free to fork this module, make the appropriate changes in a feature branch, and submit a pull request.

### Running Tests

TBD
