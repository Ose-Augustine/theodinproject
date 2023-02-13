require_relative node
class LinkedList 
    def initialize (value=[])
        @value = value
    end
    def append(value)
        new_node = Node.new(value)
        self.append(new_node)
    end 
    def prepend(value)
        new_node = Node.new(value)
        self.unshift(new_node)
    end
    def size
        self.size
    end
    def head
        self.first
    end
    def tail
        self.last 
    end
    def at(index)
        self[index]
    end
    def pop
        self.pop
    end
    def contains?(value)
        return self.any? {|node| node.include?(value)}
    end
    def find(value)
        selected_node = self.select? {|node| node.include?(value)}
        self.index(selected_node)
    end
end