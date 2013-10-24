name 'app'
description 'main magento app'

run_list(
    'apache2',
    'apache2::mod_ssl',
    'chef-magento',
    'mysql::ruby',
    'chef-magento::install',
)


# Attributes applied if the node doesn't have it set already.
default_attributes()

# Attributes applied no matter what the node has set already.
override_attributes(
  'php' => {
    'version' => '5.4'
  },
  'apache' => {
    'prefork' => {
      'startservers' => '4',
      'minspareservers' => '10'
    },
    'worker' => {
      'startservers' => '4',
      'minspareservers' => '10'
    }
  },
  'magento' => {
    'apache' => {
      'servername' => 'elasticmage.development.local',
      'secure_port' => 443
    },
    'admin' => {
      'user' => 'admin',
      'password' => 'admin123'
    },
    'db' => {
      'database' => 'elasticmage',
      'username' => 'root',
      'password' => 'root'
    },
  }
)
