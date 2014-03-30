a = Object.new
b = Object.new

a.instance_eval do
  def double(x)
    x*2
  end
end

puts b.double(3)
