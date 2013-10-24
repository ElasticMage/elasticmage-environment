
= Prepare dev environment =

bundle install --path=.bundle/gems/
pushd tools/chef
bundle exec librarian-chef install
popd
pushd tools/vagrant
bundle exec vagrant up
popd

