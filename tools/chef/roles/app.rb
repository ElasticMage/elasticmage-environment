name 'app'
description 'main magento app'

run_list(
    'apache2',
    'apache2::mod_ssl',
    'chef-magento',
    'mysql::ruby',
    'chef-magento::install',
)
