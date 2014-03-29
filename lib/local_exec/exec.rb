module LocalExec
  class Exec
    include FromHash
    attr_accessor :gemfile
    fattr(:args) { [] }
    def gemfile=(f)
      @gemfile = if f.kind_of?(String)
        Gemfile.new(filename: f)
      else
        f
      end
    end

    fattr(:addl_gems) { [] }
    fattr(:local_gems) { [] }
    fattr(:new_gemfile) do
      gemfile.addl_gems = addl_gems
      gemfile.local_gems = local_gems
      gemfile.new_filename
    end

    def cmd
      a = args.join(" ")
      "bundle exec #{a}"
    end

    def exec!
      ENV['BUNDLE_GEMFILE'] = new_gemfile
      puts "running #{cmd}"
      exec cmd
    end

  end
end