module LocalExec
  class Command
    fattr(:parsed) do
      Trollop::options do
        stop_on_unknown
        opt :addl, "Additional gems", default: ""
        opt :local, "Local gems", default: ""
        opt :bundlecmd, "Bundle Command", default: "exec"
      end
    end
    def addl_gems
      parsed[:addl].split(",")
    end
    def local_gems
      parsed[:local].split(",")
    end
    def bundle_cmd
      parsed[:bundlecmd]
    end
    
    def remaining_args
      ARGV
    end
  end
end