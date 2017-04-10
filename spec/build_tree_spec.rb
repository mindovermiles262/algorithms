require './lib/node'
require './lib/build_tree'

describe "Node" do
    it 'initializes with correct values' do
        node = Node.new(4)
        expect(node.value).to eql(4)
        expect(node.parent).to eql(nil)
        expect(node.left_child).to eql(nil)
        expect(node.right_child).to eql(nil)
    end
end

describe '#build_tree' do
    context 'initialization' do
        it 'raises error if no array passed' do
            expect { BuildTree.new }.to raise_error(ArgumentError)
        end
    end

    context 'from an array' do
            before do
                @tree = BuildTree.new( [1,4,7,3,9] )
            end

        it 'sets root node' do
            expect(@tree.root_node.value).to eql(1)
        end

        it 'tracks parent node' do
            expect(@tree.root_node.right_child.parent.value).to eql(1)
        end
        
        it 'works left' do
            expect(@tree.root_node.left_child).to eql(nil)
        end
        
        it 'works right' do
            expect(@tree.root_node.right_child.value).to eql(4)
        end

        it 'works right then left' do
            expect(@tree.root_node.right_child.left_child.value).to eql(3)
        end
    end
        
end

describe '#breadth_first_search' do
        before do
            @tree = BuildTree.new( [4,1,7,6,3,9] )
        end

    it 'returns nil if query not found' do
        expect(@tree.breadth_first_search(8)).to eql(nil)
    end

    it 'finds query in root node' do
        node = @tree.breadth_first_search(4)
        expect(node.value).to eql(4)
    end

    it 'finds query in left child' do
        node = @tree.breadth_first_search(6)
        expect(node.parent.value).to eql(7)
    end

    it 'finds query in right child of root' do
        node = @tree.breadth_first_search(7)
        expect(node.parent.value).to eql(4)
    end

    it 'finds query in right childs' do
        node = @tree.breadth_first_search(3)
        expect(node.parent.value).to eql(1)
    end
end

describe '#depth_first_search' do
    # left off here 04/10
end