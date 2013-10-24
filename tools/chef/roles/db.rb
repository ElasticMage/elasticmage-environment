name 'db'
description 'prep DB environment'

run_list([
    'mysql::server',
])


# Attributes applied if the node doesn't have it set already.
default_attributes()

# Attributes applied no matter what the node has set already.
override_attributes(
  'mysql' => {
    'server_root_password' => 'root',
    'server_repl_password' => 'rootrepl',
    'server_debian_password' => 'root',
    'bind_address' => '0.0.0.0',
    'master' => true
  },
)
