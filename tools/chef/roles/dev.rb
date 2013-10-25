name 'dev'
description 'prep dev environment'

run_list([
    'role[db]',
    'role[elasticsearch]',
    'chef-magento::self_signed_ssl',
    'role[app]',
])
