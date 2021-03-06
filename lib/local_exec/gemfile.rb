module LocalExec
  class MyGem
    include FromHash
    attr_accessor :name, :arguments

    def to_s
      "gem '#{name}'"
    end

    def to_s_local
      "gem '#{name}', git: \"https://" + '#{ENV[\'GITHUB_TOKEN\']}' + ":x-oauth-basic@github.com/mharris717/#{name}.git\", branch: :master"
      #git: "https://#{ENV['GITHUB_TOKEN']}:x-oauth-basic@github.com/mharris717/#{name}.git", branch: :master
    end

  end
  class Gemfile
    include FromHash
    attr_accessor :filename
    fattr(:source_body) { File.read(filename) }

    fattr(:addl_gems) { [] }
    fattr(:local_gems) { [] }

    def proj_name
      if filename
        filename.split("/")[-2]
      else
        nil
      end
    end

    fattr(:missing_gems) do
      dups = addl_gems.select { |c| has_gem?(c) }
      #puts "DUPS: #{dups.inspect}" if dups.size > 0
      res = addl_gems - dups - [proj_name]
      res -= ['mongoid_gem_config'] if proj_name == 'define_task'
      res
    end

    fattr(:gems) { [] }
    def add_gem(name,*args)
      self.gems << MyGem.new(name: name, arguments: args)
    end

    def print!
      gems.each do |g|
        puts g.name
      end
    end

    def evaluate!
      dsl = DSL.new(gemfile: self)
      dsl.instance_eval(source_body)
    end

    def has_gem?(g)
      gems.any? { |x| x.name.to_s == g.to_s }
    end

    fattr(:new_filename) do
      res = "#{LocalExec.root}/tmp/#{rand(10000000000000)}_Gemfile"
      File.create res, body
      res
    end

    def body
      all_gems = gems + missing_gems.map { |x| MyGem.new(name: x) }

      res = all_gems.map do |g|
        if local_gems.include?(g.name)
          g.to_s_local
        else
          g.to_s
        end
      end

      res.join("\n")
    end


  end
end