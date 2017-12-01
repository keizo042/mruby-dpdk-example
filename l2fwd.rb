class Config
  attr_reader :timer_sec
  def initialize
  end
  def parse(argv)
  end
end

def reset(r,c)
  r.ports.each do |port|
    return unless port.enable?
end

runtime = DPDK::EAL.new(DPDK::EAL::Config.parse(ARGV))
c = Config.parse(runtime.argv)
c.timer_period *= runtime.get_timer_hz
