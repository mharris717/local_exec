module LocalExec
  class DSL
    include FromHash
    attr_accessor :gemfile
    def gem(*args)
      puts "CALL gem #{args.inspect}"
      gemfile.add_gem(*args)
    end
    def source(*args)
      puts "CALL source #{args.inspect}"
    end
    def group(*args,&b)
      puts "CALL group #{args.inspect}"
      instance_eval(&b)
    end
  end
end