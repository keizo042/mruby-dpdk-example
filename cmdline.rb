del_show_tokens = []
add_tokens = []
help_tokens = []

def cmd_del_show
end

def cmd_add
end

def cmd_help
end

del = DPDK::Cmdline.new("del_show",del_show_tokens) do |obj|
  cmd_del_show(obj)
end
add = DPDK::Cmdline.new("add",add_tokens) do |obj|
  cmd_add(obj)
end
del = DPDK::Cmdline.new("help", help_tokens) do |obj|
  cmd_help(obj)
end


cmds = [
  del,
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
