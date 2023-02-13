require_relative 'node'
class LinkedList 
    attr_accessor :value
    def initialize (value=[])
        @value = value
    end

    #is called to rearrange the linked list anytime
    #there is a mutation 
    def linker
        i = 0
        while i < @value.length
            @value[i].link = @value[i+1]
            i += 1
        end
    end
    def append(value)
        new_node = Node.new(value)
        @value.push(new_node)
        if @value.length > 1
            self.linker
        end
    end 
    def prepend(value)
        new_node = Node.new(value)
        @value.unshift(new_node)
        self.linker
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
        selected_node = @value.select {|node| node.value.include?(value)}[0]
        return @value.index(selected_node)
    end
    def to_s
        @value.each {|node| p node.to_s}
    end
    def insert_at (value,index)
        new_node = Node.new(value)
        @value.insert(index,new_node)
        self.linker
    end
    def remove_at(index)
        @value.delete_at(index)
    end
end
node = Node.new([1])
test = LinkedList.new()
test.append([2])
test.append([3,4])
test.append([3,55,6])
test.append([55,42,55])
test.insert_at([88,99],1)
test.value.each {|node| p "This is node:#{node.link.value}\n"}