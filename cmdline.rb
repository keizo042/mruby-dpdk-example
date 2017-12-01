def del_show
end

def add
end

def help
end

cmds = [
  del_show,
  add,
  help,
]

begin 
  runtime = DPDK::EAL.new(DPDK::Config.parse(ARGV))
  cmdline = runtime.create_cmdline(cmds)
  cmdline.intaract
  cmdline.exit
rescue DPDK::InitError => e
  puts e
rescue DPDK::Cmdline::InitError => e
  puts e
end
