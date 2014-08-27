#
class mysqldump (
  $date_format       = $mysqldump::params::date_format,
  $date_path         = $mysqldump::params::date_path,
  $dump_dir          = $mysqldump::params::dump_dir,
  $gzip_path         = $mysqldump::params::gzip_path,
  $mysqldump_options = $mysqldump::params::mysqldump_options,
  $mysqldump_path    = $mysqldump::params::mysqldump_path,
  $scripts_dir       = $mysqldump::params::scripts_dir,
) inherits mysqldump::params {

  
  concat { "${scripts_dir}/backup_mysql_databases.sh":
    ensure         => 'present',
    ensure_newline => true,
    group          => 'root',
    owner          => 'root',
    mode           => '0770',
    replace        => true,
  }
    
  concat::fragment { 'backup_mysql_script_header':
    target  => "${scripts_dir}/backup_mysql_databases.sh",
    content => template('mysqldump/mysql-backup-header.erb'),
    order   => '01',
  }

}