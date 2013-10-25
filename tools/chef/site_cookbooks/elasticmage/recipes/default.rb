
# Allow HTTP, HTTPS
simple_iptables_rule "http" do
  rule [ "--proto tcp --dport 80",
         "--proto tcp --dport 443" ]
  jump "ACCEPT"
end

cookbook_file "/usr/local/src/magento_sample_data_for_1.6.1.0.sql.bzip2" do
  source "magento_sample_data_for_1.6.1.0.sql.bzip2"
  mode 0644
  owner "root"
  group "root"
end

bash "install sample DB" do
    user 'root'
    code <<-EOH
        echo "create database #{node['magento']['db']['database']}" | mysql -u root -p#{node['mysql']['server_root_password']} &&
        cat /usr/local/src/magento_sample_data_for_1.6.1.0.sql.bzip2 | bzip2 -d | /usr/bin/mysql -u root -p#{node['mysql']['server_root_password']} #{node['magento']['db']['database']} -v
EOH
    not_if "echo 'select NOW()' | /usr/bin/mysql -u root -p#{node['mysql']['server_root_password']} #{node['magento']['db']['database']}"
end
