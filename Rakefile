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
task :cfv => :get_vdi do

  puts "=== :cfv"
  begin
    sh "scripts/vbox.create-vm-from-vdi.sh  #{@vm} #{@iso} #{@add} #{@work_vdi}"
  rescue
    printf "\nrake: cfv: Error. Check if vm already exists.\n\n"
  end
  puts

end

desc "internal: copy work VDI file"
task :get_vdi do
  puts "=== :get_vdi"
  sh "mkdir -p #{@tmp_dir}"
  sh "[ -f #{@work_vdi} ] || /bin/cp #{@vdi} #{@work_vdi}"
  puts
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

@tmp_dir  = "#{__dir__}/tmp"
@work_vdi = "#{@tmp_dir}/#{File.basename(@vdi)}"

# require 'pp'
# pp @config

# puts "__FILE__ :" + __FILE__
# puts "__dir__  :"  + __dir__

