class Node

    attr_accessor :value, :parent, :left_child, :right_child

    def initialize # (value, parent = nil, left_child = nil, right_child = nil)
        @value = nil
        @parent = nil
        @left_child = nil 
        @right_child = nil
    end
end

class BuildTree

    attr_accessor :root_node

    def initialize(data)
        @root_node = nil
        build_tree(data)
    end

    def build_tree(data)
        data.each do |value|
            node = make_node(value)
            place_node(node)
        end
    end
    
    def make_node(value)
        node = Node.new
        node.value = value
        node
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
                place_node(node, current_node.right_child)
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

tree_array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = BuildTree.new(tree_array)
puts node.nil? ? "The node was not found" : "The node was found"