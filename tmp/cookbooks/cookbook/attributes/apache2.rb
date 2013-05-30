include_attribute "sylius::default"
default["sylius"]["apache2"]["path"] = "/var/www/#{node['sylius']['project_name']}"
default["sylius"]["apache2"]["docroot"] = "#{node['sylius']['apache2']['path']}/web"
default["sylius"]["apache2"]['server_name'] = node['sylius']['project_name']