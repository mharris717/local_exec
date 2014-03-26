require 'mharris_ext'
require 'andand'
require 'mongoid'
require 'mongoid_gem_config'
require 'trollop'

module LocalExec
  class << self
    def load!
      %w(dsl gemfile exec command).each do |f|
        load File.dirname(__FILE__) + "/local_exec/#{f}.rb"
      end
    end
    def root
      File.expand_path(File.dirname(__FILE__) + "/..")
    end
  end
end

MongoidGemConfig.register_gems LocalExec

LocalExec.load!
