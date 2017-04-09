class BuildTree
    require './lib/node'

    attr_accessor :root_node

    def initialize(array)
        @root_node = nil
        build_tree(array)
    end


    private


    def build_tree(data)
        data.each do |value|
            node = make_node(value)
            place_node(node)
        end
        return data
    end
    
    def make_node(value)
        node = Node.new
        node.value = value
        return node
    end

    def place_node(node, current_node = @root_node)
        @root_node ||= node
        return if node == @root_node
            
        if node.value < current_node.value
            if current_node.left_child == nil
                current_node.left_child = node
                node.parent = current_node
                return node
            else
                place_node(node, current_node.left_child)
            end   
        else
            if current_node.right_child == nil  
                current_node.right_child = node
                node.parent = current_node
                return node
            else
                place_node(node, current_node.right_child)
            end          
        end
    end
    
end
