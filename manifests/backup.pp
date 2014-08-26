#
define mysqldump::backup (
  $date_format       = $mysqldump::date_format,
  $date_path         = $mysqldump::date_path,
  $dump_dir          = $mysqldump::dump_dir,
  $gzip_path         = $mysqldump::gzip_path,
  $mysql_user        = $mysqldump::mysql_user,
  $mysql_password    = $mysqldump::mysql_password,
  $mysqldump_options = $mysqldump::mysqldump_options,
  $mysqldump_path    = $mysqldump::mysqldump_path,
  $scripts_dir       = $mysqldump::scripts_dir,
) {

  $db = $name
  concat::fragment { $name:
    target  => "${scripts_dir}/backup_mysql_databases.sh",
    content => template('mysqldump/mysql-backup-fragment.erb'),
    order   => '10',
  }

}