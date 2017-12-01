class App
  attr_reader :runtime
  def initialize(c)
    @config = c
    @eal = DPDK::EAL.new
  end

  def run
    slave =Slave.new
    core_id = @eal.get_lcore
    @eal.lanch(core_id) do |obj|
      begin
      slave.run obj
      rescue => e
        put e
      end
    end

    ethapp = EthApp.new (@eal).run
  end

  class Config
  end

  class Slave
    def initialize
    end
    def run
    end
  end

  class PCMD
  end

  class EthApp
    quit_tokens = []
    cmd = [
      DPDK::Cmdline::Inst.new("help quit",quit_tokens) do |obj|
        cmd_quit(obj)
      end,
    ]
    attr_reader :cmdline
    def initialize(c)
      @cmdline =  c.create_cmdline(cmds)
    end

    def run
      @cmldine.intract
      @cmdline.exit
    end
  end
end

begin
c = Config.new
app = App.new(c)
app.run
app.eal.waitallcore
rescue => e
  put e
end
