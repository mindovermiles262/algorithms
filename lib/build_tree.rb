class BuildTree
    require './lib/node'

    attr_accessor :root_node

    def initialize(array)
        @root_node = nil
        build_tree(array)
    end

    def breadth_first_search(query)
        # Visit all nodes at the same level before visiting nodes at next deeper 
        # level. Enqueues left then right child nodes and checks value FIFO.
        # Returns nil if query not found
        
        queue = Array.new
        queue << @root_node

        until queue.empty?
            current_node = queue.shift
            if current_node.value == query
                return current_node
            else
                queue << current_node.left_child if current_node.left_child
                queue << current_node.right_child if current_node.right_child
            end
        end

        return nil
    end

    def depth_first_search(query)
        # left off here 04/10/17 
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
