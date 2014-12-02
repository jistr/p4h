require 'facter'
require 'fileutils'
require 'yaml'

lockfile_path = '/tmp/factexport_generating_yaml'
factexport_dir = '/tmp/factexport'
FileUtils.mkdir_p(factexport_dir)

# make the yaml string a fact to export it using @@
Facter.add(:factexport_local_yaml) do
  setcode do
    if File.exists?(lockfile_path) # don't do infinite loop :)
      ''
    else
      # FIXME: the lock file is a possible race condition
      FileUtils.touch(lockfile_path)
      facts_yaml = `facter -y -p`
      FileUtils.rm(lockfile_path)
      facts_to_export = YAML.load(facts_yaml).reject { |k, v| k =~ /^factexport/ }
      YAML.dump(facts_to_export)
    end
  end
end

# collect all exported facts into a local fact
Facter.add(:factexport) do
  setcode do
    fact_data = {}
    hostnames = Dir.glob("#{factexport_dir}/*").map {|path| File.basename(path) }
    hostnames.each do |hostname|
      fact_data[hostname] = YAML.load(File.read("#{factexport_dir}/#{hostname}"))
    end
    fact_data
  end
end
