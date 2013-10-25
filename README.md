
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

