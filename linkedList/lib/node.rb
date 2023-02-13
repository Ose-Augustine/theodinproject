class Node
    attr_accessor :value,:link
    def initialize(value=nil,link={})
        @value = value
        @link = link
    end 
end