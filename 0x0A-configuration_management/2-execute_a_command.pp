# Executing commad
exec { 'pkill killmenow':
  pkill => '/usr/bin:/usr/sbin:/bin'
}
