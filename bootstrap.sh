# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
  echo installing $1
  shift
  apt-get -y install "$@" >/dev/null 2>&1
}

# Locale
sudo locale-gen en_US.UTF-8
sudo update-locale LANG=en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8

echo adding elasticsearch repositories
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add - >/dev/null 2>&1
echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list >/dev/null 2>&1

echo updating package information
apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
apt-get -y update >/dev/null 2>&1

# MySQL
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
install MySQL mysql-server libmysqlclient-dev

# Additional software
install Git git
install SQLite sqlite3 libsqlite3-dev
install memcached memcached
install Redis redis-server
install RabbitMQ rabbitmq-server
install Elasticsearch elasticsearch
install 'Nokogiri dependencies' libxml2 libxml2-dev libxslt1-dev
install 'ExecJS runtime' nodejs
