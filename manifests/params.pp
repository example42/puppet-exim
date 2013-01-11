# Class: exim::params
#
# This class defines default parameters used by the main module class exim
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to exim class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class exim::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'exim4',
    default                   => 'exim',
  }

  $service = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'exim4',
    default                   => 'exim',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'exim',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'exim',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/exim',
  }

  # For semplicity and lack of time to deploy a sensible configuration we consider
  # as exim config file on Ubuntu/Debian the debconf file, which is evaluated when the service
  # is started. This file has not the format and the syntax of the official exim file.

  $config_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/exim4/update-exim4.conf.conf',
    default                   => '/etc/exim/exim.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'root',
    default                   => 'mail',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/exim',
    default                   => '/etc/sysconfig/exim',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/exim.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/exim',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/exim',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/exim/exim.log',
  }

  $port = '25'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = '127.0.0.1'
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
