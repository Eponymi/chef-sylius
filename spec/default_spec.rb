require 'spec_helper'
#require 'minitest/spec'

describe 'sylius::default' do
  #let (:chef_run) { ChefSpec::ChefRunner.new.converge 'sylius::default' }
  let (:chef_run) { ChefSpec::ChefRunner.new(cookbook_path: 'vendor/cookbooks').converge 'sylius::default' }
  #ChefSpec::ChefRunner.new(cookbook_path: 'vendor/cookbooks')
  #chef_run = ChefSpec::ChefRunner.new do |node|
    #node["sylius"]["apache2"]["path"] = '/var/www/sylius'
    #node.sylius.apache2.path = '/var/www/sylius'
    #node['my_other_attribute'] = 'bar2'
    #node.default["sylius"]["project_name"] = "sylius"
  #end
  
  it 'does something' do
    #chef_run = ChefSpec::ChefRunner.new
    pending 'Your recipe examples go here.'
  end
  
  it 'creates the application directory' do
    chef_run.node.default["sylius"]["project_name"] = "sylius"
    chef_run.should create_directory "/var/www/sylius"
  end
  
  it "starts apache" do
    expect(chef_run).to start_service 'apache2'
  end
  
  it "creates the web app configuration file" do
    application_name = chef_run.node["sylius"]["project_name"]
    expect(chef_run).to create_file "#{chef_run.node['apache']['dir']}/sites-available/#{application_name}.conf"
  end
  
  it "starts php" do
    expect(chef_run).to start_service 'php'
  end
  
end
