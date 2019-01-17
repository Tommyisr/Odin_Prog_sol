puts 'Give me what you want to encrypt'
str = gets.strip

puts 'what\'s the key?'
key = gets.strip.to_i

AUP = 65
ZUP = 90
ADOWN = 97
ZDOWN = 122




def caesar str,key 
csr = ''
chr = nil
key = key%26
    str.each_byte do |x|
        # puts x.ord 
        if (AUP..ZUP).include? x
            # puts 'HA'
            chr = x + key
            if !(AUP..ZUP).include? chr
                chr = chr + AUP - ZUP - 1
            end
            csr += chr.chr
        elsif (ADOWN..ZDOWN).include? x
            # puts 'ha'
            chr = x + key
            if !(ADOWN..ZDOWN).include? chr
                chr = chr + ADOWN - ZDOWN - 1
            end
            csr += chr.chr
        else
            csr += x.chr
        end
end

return csr
end


puts caesar(str,key)
