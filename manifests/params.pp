#
class mysqldump::params {

  $date_format       = '+%F'
  $date_path         = '/bin/date'
  $dump_root_dir     = '/var/backup'
  $gzip_path         = '/bin/gzip'
  $mysqldump_options = ''
  $mysqldump_path    = '/usr/bin/mysqldump'
  $script_dir        = '/var/scripts/backup_scripts'
  $script_file_group = 'root'
  $script_file_mode  = '0700'
  $script_file_name  = 'backup_mysql_databases.sh'
  $script_file_owner = 'root'

}

