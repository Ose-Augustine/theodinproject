require_relative 'node'
class LinkedList 
    attr_accessor :value
    def initialize (value=[])
        @value = value
    end
    def append(value)
        new_node = Node.new(value)
        @value.push(new_node)
    end 
    def prepend(value)
        new_node = Node.new(value)
        @value.unshift(new_node)
    end
    def size
        counter = 0
        @value.each {|node| counter += 1}
        return counter
    end
    def head
        @value.first
    end
    def tail
        @value.last 
    end
    def at(index)
        @value[index]
    end
    def pop
        @value.pop
    end
    def contains?(value)
        return @value.any? {|node| node.value.include?(value)}
    end
    def find(value)
        selected_node = @value.select {|node| node.value.include?(value)}
        return @value.index(selected_node)
    end
end

test = LinkedList.new()
test.append([2])
test.append([3,4])
test.append([3,55,6])
test.append([55,42,55])
p test.head
p test.contains?(78)
p test.tail
p test.at(2)
p test.size
p test.find(42)
p test.value
