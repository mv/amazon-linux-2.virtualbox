#
# vim:ft=ruby
#

##
## Tasks
##

desc "vbox: create from VDI"
task :'create-from-vdi' => :cfv do
end

desc "vbox: create from VDI"
task :cfv do

# begin
    puts "scripts/vbox.create-vm-from-vdi.sh  #{@vm} #{@iso} #{@add} #{@vdi}"
# rescue
#   printf "\nrake: cfv: error.\n\n"
# end

end

desc "vbox: delete vm"
task :dm do

  begin
    sh "scripts/vbox.delete-vm.sh #{@machine_name}"
  rescue
    printf "\nrake: dm: error.\n\n"
  end

end

desc "cloudformation: update-stack"
task :'update-stack' => :us do
end

desc "cloudformation: update-stack"
task :us do

  begin
    sh %Q{
    }.gsub(/^[ ]*/,'').gsub(/[ ]+/,' ')
  rescue
    printf "\nrake: aws cloudformation: no updates.\n\n"
  end

end


###
### Helpers
###
def usage()
  puts <<-USAGE

Usage:
  $ config=my-config.yml rake <task>

Default parameter file:
  - #{@config}

  USAGE
end

task :default do
  usage()

  puts "List of tasks:"
  tasks = `rake --tasks`
  tasks.each_line { |line|  puts "  #{line}" unless line == 'nil' }
  puts

end


###
### Settings
###

require 'yaml'

## caller directory
@previous_dir = ENV['PWD']

@config = ENV['config'] || 'config/amzn2.latest.yml'

@cfg = YAML.load_file( @config )
@vm  = @cfg['machine_name']
@vdi = @cfg['vdi']
@add = @cfg['add']
@iso = @cfg['iso']

# require 'pp'
# pp @config

