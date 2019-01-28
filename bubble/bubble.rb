

def bubble_sort arr
arr.length.times do
arr.each_with_index do |x,i|
    if arr[i+1].is_a? Integer and arr[i] > arr[i+1]
        arr[i],arr[i+1] = arr[i+1],arr[i]
        
    end
end
end
arr.inspect
end


def bubble_sort_by arr,&block
    arr.length.times do
        arr.each_with_index do |x,i|
            if arr[i+1].is_a? String and yield(arr[i], arr[i+1]) > 0
        arr[i],arr[i+1] = arr[i+1],arr[i]

            end

        end

    end
puts arr.inspect
end



arr = [9,8,7,6,4,3,2,1]

puts bubble_sort arr


bubble_sort_by(["hi","hello","hey", 'zalupa', 'koshkapyos', 'pidor']) do |left,right|
 left.length - right.length
 end