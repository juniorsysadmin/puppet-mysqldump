#
class mysqldump::params {

  $date_format       = '+%F'
  $date_path         = '/bin/date'
  $dump_dir          = '/var/backup'
  $gzip_path         = '/bin/gzip'
  $mysql_password    = 'password'
  $mysql_user        = 'user'
  $mysqldump_options = '--routines'
  $mysqldump_path    = '/usr/bin/mysqldump'
  $scripts_dir       = '/var/scripts/backup_scripts'

}