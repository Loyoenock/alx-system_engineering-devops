# Executing commad
exec { 'pkill killmenow':
  path => '/usr/bin:/usr/sbin:/bin'
}

