# automating creating a custom HTTP header response with Puppet.

exec { 'command':
  command => 'apt-get -y install -y update;
  sudo sed -i "/listen 80 default_server;/a add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default;
  service nginx restart',
  provider => shell,
}
