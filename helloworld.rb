def hello(s)
  puts "hello from core" + s.lcore_id
end

c = DPDK::::EAL::Config.parse(ARGV)
eal = DPDK::EAL.new(c)
eal.slaves.each do |slave|
  slave.lanch do |s|
    hello(s)
  end
end
eal.wait
