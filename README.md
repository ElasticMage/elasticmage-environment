# Prepare dev environment

## bash commands

    bundle install --path=.bundle/gems/
    pushd tools/chef
    bundle exec librarian-chef install
    popd
    pushd tools/vagrant
    bundle exec vagrant up
    popd

## /etc/hosts changes

    192.168.33.99 elasticmage.development.local


# Install MySQL replication plugin
## Setup MySQL to use replication (add to my.cnf [mysqld] section):
```
server_id           = 1
log_bin             = /var/log/mysql/mysql-bin.log
log_bin_index       = /var/log/mysql/mysql-bin.log.index
binlog_format           = ROW
```

## Upgrade python and install the MySQL plugin to the river
```shell
sudo yum install python27-devel python27-setuptools
cd /home/vagrant/
git clone git://github.com/noplay/python-mysql-replication.git
cd python-mysql-replication/
sudo easy_install-2.7 pymysql
sudo easy_install-2.7 cherrypy
python2.7 setup.py build
sudo python-2.7 setup.py install
cd /var/www/magento.development.local/elasticmage.repo/elasticsearch/river
python2.7 http_stream/http_stream.py
```

# install maven

```shell
sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install apache-maven
sudo ln -s /usr/share/apache-maven/bin/mvn /usr/bin/
```

# compile and install elasticmage plugin

```shell
cd /var/www/magento.development.local/vendor/magehack/elasticmage/elasticsearch/river
mvn clean package
sudo /usr/local/elasticsearch/bin/plugin -url file:./target/releases/elasticsearch-river-mysql-0.0.1-SNAPSHOT.zip -install mysql-river
```