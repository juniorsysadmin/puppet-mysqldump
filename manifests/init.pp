#
class mysqldump (
  $date_format       = $mysqldump::params::date_format,
  $date_path         = $mysqldump::params::date_path,
  $dump_dir          = $mysqldump::params::dump_dir,
  $gzip_path         = $mysqldump::params::gzip_path,
  $mysqldump_options = $mysqldump::params::mysqldump_options,
  $mysqldump_path    = $mysqldump::params::mysqldump_path,
  $script_dir        = $mysqldump::params::script_dir,
  $script_file_group = $mysqldump::params::script_file_group,
  $script_file_mode  = $mysqldump::params::script_file_mode,
  $script_file_name  = $mysqldump::params::script_file_name,
  $script_file_owner = $mysqldump::params::script_file_owner,
) inherits mysqldump::params {

  
  concat { "${script_dir}/${script_file_name}":
    ensure_newline => true,
    group          => $script_file_group,
    mode           => $script_file_mode,
    owner          => $script_file_owner,
  }
    
  concat::fragment { 'backup_mysql_script_header':
    content => template('mysqldump/mysql-backup-header.erb'),
    order   => '01',
    target  => "${script_dir}/${script_file_name}",
  }

}

