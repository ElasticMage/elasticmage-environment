name 'dev'
description 'prep dev environment'

run_list([
    'role[db]',
#    'role[index]',
#    'role[web]',
    'chef-magento::self_signed_ssl',
    'role[app]',
])
