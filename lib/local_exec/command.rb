module LocalExec
  class Command
    fattr(:parsed) do
      Trollop::options do
        opt :addl, "Additional gems", default: ""
        opt :local, "Local gems", default: ""
      end
    end
    def addl_gems
      parsed[:addl].split(",")
    end
    def local_gems
      parsed[:local].split(",")
    end
    def remaining_args
      ARGV
    end
  end
end