stock = [17,3,6,9,15,8,6,1,10]

# def stock_piper stock
max = 0
cur = 0
bb = nil
ss = nil
stock.each_with_index do |buy,i|
cur = cur - buy

stock.each_with_index do |sell, j|

    if j>i
cur = cur + sell
if cur >= max
    max = cur
    bb = i
    ss = j
    end
    cur = cur - sell


end
end

cur = 0

end
# str = "#{stock[ss]} - #{stock[bb]} = #{max}"
# arr = [bb,ss,max,str]
puts stock[bb]
puts stock[ss]
puts max
# puts arr

# end


# puts stock_piper stock