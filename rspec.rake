require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

extensions = []
Dir.new("vendor/extensions").entries.each { |e|
  extensions << (eval "Refinery::#{e.camelcase}") unless (e == "." || e == "..")
}

Rails.application.config.extra_rspec_paths = extensions.map {|e| e.root}

task :default => :spec
RSpec::Core::RakeTask.module_eval do
  def pattern
    extras = []
    Rails.application.config.extra_rspec_paths.each do |dir|
      if File.directory?( dir )
        extras << File.join( dir, 'spec', '**', '*_spec.rb' ).to_s
      end
    end
    [@pattern] | extras
  end
end
