#
# vim:ft=ruby
#

##
## Tasks
##

desc "vbox: DO NOT USE: create force"
task :vbox_create_force  => [ :vmstop, :vmdel, :seed, :vdi_create, :vmstart ] do
end

desc "vbox: start vm"
task :vmstart  do
  puts "=== :startvm"
  sh "VBoxManage startvm #{@vm} ; echo Done."
  puts
end

desc "vbox: stop vm"
task :vmstop  do
  puts "=== :stopvm"
  sh "VBoxManage controlvm #{@vm} poweroff ; echo Done."
  puts
end

desc "vbox: delete vm"
task :vmdel do

  puts "=== :dm"
  begin
    sh "scripts/vbox.delete-vm.sh #{@vm}"
  rescue
    printf "\nrake: dm: Error. Check if vm exists.\n\n"
  end
  puts

end

desc "vbox: create from VDI"
task :vdi_create => :vdi_get do

  puts "=== :cfv"
  begin
    sh "scripts/vbox.create-vm-from-vdi.sh  #{@vm} #{@iso} #{@add} #{@work_vdi}"
#   sh "scripts/vbox.create-vm-from-vdi.sh  #{@vm} #{@seed_file} #{@add} #{@work_vdi}"
  rescue
    printf "\nrake: cfv: Error. Check if vm already exists.\n\n"
  end
  puts

end

desc "internal: copy work VDI file"
task :vdi_get do
  puts "=== :get_vdi"
  sh "mkdir -p #{@tmp_dir}"
  sh "[ -f #{@work_vdi} ] || /bin/cp #{@vdi} #{@work_vdi}"
  puts
end

desc "vagrant: package first box"
task :vpf do
  puts "=== :vpf"
  sh "/bin/rm -f #{@tmp_dir}/#{@vm}.first.box"
  sh "vagrant package --base #{@vm} --output #{@tmp_dir}/#{@vm}.first.box"
  puts
end



desc "seed: create seed-boot.iso"
task :seed => :seed_cleanup do

  puts "=== :seed"

  # Start from scratch
  sh "mkdir -p #{@seed_dir}"

  # Seed info
  sh "/bin/cp #{@cfg['metadata']} #{@seed_dir}/metadata"
  sh "/bin/cp #{@cfg['userdata']} #{@seed_dir}/userdata"

  # Extras: for verification
# sh "/bin/cp #{@cfg['metadata']} #{@seed_dir}/"
# sh "/bin/cp #{@cfg['userdata']} #{@seed_dir}/"
# sh %Q{touch #{@seed_dir}/"Created_at_`/bin/date '+%Y-%m-%d_%H%M%S_GMT%Z'`" }

  #
  sh "scripts/gen-seed-iso.macos.sh #{@seed_file} #{@seed_dir}"
  puts

end

desc "internal: seed cleanup"
task :seed_cleanup do

  puts "=== :seed_cleanup"

  # Force a cleanup
  sh "/bin/rm -rf #{@seed_dir} #{@seed_file}"
  puts

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

## vdi file
@tmp_dir  = "#{__dir__}/tmp"
@work_vdi = "#{@tmp_dir}/#{File.basename(@vdi)}"

## seed.iso file
@seed_dir  = "#{@tmp_dir}/seedconfig"
@seed_file = "#{@tmp_dir}/seed-data.iso"

# require 'pp'
# pp @config

# puts "__FILE__ :" + __FILE__
# puts "__dir__  :"  + __dir__

