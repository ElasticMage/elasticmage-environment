name 'elasticsearch'
description 'prep index environment'

run_list([
    'java::openjdk',
    'elasticsearch',
])
