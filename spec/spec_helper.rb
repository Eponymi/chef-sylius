require 'chefspec'
require 'berkshelf'

TOPDIR = File.expand_path(File.join(File.dirname(__FILE__), ".."))
$: << File.expand_path(File.dirname(__FILE__))

Berkshelf.ui.mute!
berks = Berkshelf::Berksfile.from_file(File.join(TOPDIR, 'Berksfile'))
berks.install(path: 'vendor/cookbooks')
 
#ChefSpec::ChefRunner.new(cookbook_path: 'vendor/cookbooks')
