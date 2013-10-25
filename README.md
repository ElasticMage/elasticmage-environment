
= Prepare dev environment =

bundle install --path=.bundle/gems/
pushd tools/chef
bundle exec librarian-chef install
popd
pushd tools/vagrant
bundle exec vagrant up
popd

add to your hosts:
192.168.33.99 elasticmage.development.local

