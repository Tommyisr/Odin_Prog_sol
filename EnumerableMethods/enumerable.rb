class Hash
    def << x
        self[x[0]] = x[1]
    end
    
end

module Enumerable
    def my_each 

        for element in self
            yield element
        end

    end

    def my_each_with_index &block
        i = 0
        for element in self
            yield element,i
            i+=1
        end
    end


    def my_select &block
        # arr = []
        self.class == Hash ? arr = {} : arr = []
        self.my_each do |x|
            arr << x if yield x       
         end
        arr
    end


    def my_all? &block
        self.my_each do |x|
            return false if yield(x) == false
        end

        true
    end

    def my_any? &block
        self.my_each do |x|
            return true if yield(x) == true
        end
        false
    end
    
    def my_none? &block
        self.my_each do |x|
            return false if yield(x) == true
        end
        true
    end
    

        def my_count arg=nil
            arr = []
            if block_given?
                # i = 0
                arr = self.my_select {|x| yield x}
            elsif arg != nil
                arr = self.my_select {|x| x == arg}

            else 
                return self.size 
            end
            arr.size
        end

        def my_map proc=nil
            arr = []
            if proc
                self.my_each {|x| arr << proc.call(x)}
            else
                self.my_each {|x| arr << yield(x)}

            end
            arr



        end



end



arr = ['a','b','c','c','d']
arrnum = [1,2,3,4,5,6]
hash = {a:1,b:2,c:3,d:4}
# arr.each {|x| puts x}
# arr.my_each {|x| puts x}
# hash.each {|x,y| puts x.to_s+y.to_s}
# hash.my_each {|x,y| puts x.to_s+y.to_s}

# arr.each_with_index {|x,y| puts x.to_s+y.to_s}
# arr.each_with_index {|x,y| puts x.to_s+y.to_s}
# hash.each_with_index {|x,y| puts x.to_s+y.to_s}
# hash.my_each_with_index {|x,y| puts x.to_s+y.to_s}

# puts arr.select {|x| x<'c'}
# puts arr.my_select {|x| x<'c'}
# puts hash.select {|x,y| y<4}
# puts hash.my_select {|x,y| y<4}

#  puts arr.all? {|x| x<'d'}
#  puts arr.all? {|x| x<'f'}
#  puts arr.my_all? {|x| x<'d'}
#  puts arr.my_all? {|x| x<'f'}
# puts hash.all? {|x,y| y<4}
# puts hash.all? {|x,y| y<5}
# puts hash.my_all? {|x,y| y<4}
# puts hash.my_all? {|x,y| y<5}

#  puts arr.any? {|x| x<'d'}
#  puts arr.any? {|x| x<'a'}
#  puts arr.my_any? {|x| x<'d'}
#  puts arr.my_any? {|x| x<'a'}
# puts hash.any? {|x,y| y<4}
# puts hash.any? {|x,y| y<0}
# puts hash.my_any? {|x,y| y<4}
# puts hash.my_any? {|x,y| y<0}


#  puts arr.none? {|x| x<'d'}
#  puts arr.none? {|x| x<'a'}
#  puts arr.my_none? {|x| x<'d'}
#  puts arr.my_none? {|x| x<'a'}
# puts hash.none? {|x,y| y<4}
# puts hash.none? {|x,y| y<0}
# puts hash.my_none? {|x,y| y<4}
# puts hash.my_none? {|x,y| y<0}

# puts arr.count
# puts arr.count('c')
# puts arr.count {|x| x<'c'}
# puts arr.my_count
# puts arr.my_count('c')
# puts arr.my_count {|x| x<'c'}

# puts hash.count
# puts hash.count{|x,y| y<3}
# puts hash.my_count
# puts hash.my_count{|x,y| y<3}

# puts arrnum.map {|x| x*2}
# puts arrnum.my_map {|x| x*2}
# proc = Proc.new {|x| x*3}
# puts arrnum.my_map(proc)
# puts arrnum.my_map(proc) {|x| x*2}

