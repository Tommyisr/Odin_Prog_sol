 dictionary = ["below","down","go","going","horn",
    "how","howdy","it","i","low","own","part","partner","sit"]

   #  hh = {}
str = 'Howdy partner, sit down! How\'s it going?'
    def substring str, dictionary 
      hh = {}
      str.downcase!
      dictionary.each do |word|

         array = str.scan(word)
         if !array.empty?
            hh[word] = array.length
            
         end

      end
return hh
    end


    puts substring str, dictionary