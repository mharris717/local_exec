module LocalExec
  class Gemfile
    include FromHash
    attr_accessor :filename
    fattr(:gems) { [] }
    def add_gem(name,*args)
      self.gems << OpenStruct.new(name: name, args: args)
    end

    def print!
      gems.each do |g|
        puts g.name
      end
    end

    def evaluate!
      body = File.read(filename)
      dsl = DSL.new(gemfile: self)
      dsl.instance_eval(body)
    end

    def has_gem?(g)
      gems.any? { |x| x.name.to_s == g.to_s }
    end

    def missing_gems(candidates)
      dups = candidates.select { |c| has_gem?(c) }
      puts "DUPS: #{dups.inspect}" if dups.size > 0
      candidates - dups
    end

    def filename_with_addl_gems(addl)
      addl = missing_gems(addl)
      body = File.read(filename)
      addl.each do |g|
        body << "\nprivate_gem '#{g}'"
      end
      res = "#{LocalExec.root}/tmp/#{rand(10000000000000)}_Gemfile"
      File.create res, body
      res
    end


  end
end