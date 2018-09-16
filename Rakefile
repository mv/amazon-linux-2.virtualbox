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
    sh "scripts/vbox.new-linux-server.sh  #{@machine_name} #{@iso}"
#   sh "scripts/vbox.attach-vdi.sh        #{@machine_name} #{@vdi}"
    sh "scripts/vbox.attach-additions.sh  #{@machine_name} #{@add}"
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

#desc "cloudformation: update-stack"
task :'update-stack' => :us do
end

#desc "cloudformation: update-stack"
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

Parameter file YAML format:

  USAGE
end

task :default do
  usage()

  puts "List of tasks:"
  tasks = `rake --tasks`
  tasks.each_line { |line|  puts "  #{line}" }
  puts

end


###
### Settings
###

## caller directory
@dir = ENV['PWD']

require 'yaml'
@config = YAML.load_file( ENV['config'] )
@machine_name = @config['machine_name']
@add = @config['add']
@iso = @config['iso']
@vdi = @config['vdi']

require 'pp'
pp @config

