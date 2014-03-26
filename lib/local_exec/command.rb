module LocalExec
  class Command
    def addl_gems
      opts = Trollop::options do
        opt :addl, "Additional gems", default: ""
      end
      res = opts[:addl].split(",")
    end
  end
end