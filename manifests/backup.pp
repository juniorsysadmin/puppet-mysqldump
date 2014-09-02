#
define mysqldump::backup (
  $date_format       = $mysqldump::date_format,
  $date_path         = $mysqldump::date_path,
  $dump_root_dir     = $mysqldump::dump_root_dir,
  $gzip_path         = $mysqldump::gzip_path,
  $mysqldump_options = $mysqldump::mysqldump_options,
  $mysqldump_path    = $mysqldump::mysqldump_path,
  $script_dir        = $mysqldump::script_dir,
  $script_file_name  = $mysqldump::script_file_name,
) {

  $db = $name

  concat::fragment { $name:
    target  => "${script_dir}/${script_file_name}",
    content => template('mysqldump/mysql-backup-fragment.erb'),
    order   => '10',
  }

}

