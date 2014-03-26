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
    fattr(:new_gemfile) do
      gemfile.filename_with_addl_gems(addl_gems)
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