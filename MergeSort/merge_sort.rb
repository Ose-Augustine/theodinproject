
def merge_sort(array)
    #base case
    return array if array.length < 2 

    #splits the array and returns an array of arrays
    #of same lengths if even or different lengths 
    #if odd
    new_split = array.each_slice(((array.size)/2.0).round).to_a
    first,second = merge_sort(new_split[0]),merge_sort(new_split[1])
    sorted = []
    until first.empty? || second.empty?
        if first.first <= second.first
            sorted.append(first.shift)
        else
            sorted.append(second.shift)
        end
    end
    sorted + first + second
end
p merge_sort([5,2,1,6,3,4])