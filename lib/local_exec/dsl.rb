module LocalExec
  class DSL
    include FromHash
    attr_accessor :gemfile
    def gem(*args)
      gemfile.add_gem(*args)
    end
    def source(*args)
    end
    def group(*args,&b)
      instance_eval(&b)
    end
  end
end