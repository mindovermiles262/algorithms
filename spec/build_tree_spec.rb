require './lib/node'
require './lib/build_tree'

describe "Node" do
    it 'raises error if no value passed' do
        expect { Node.new }.to raise_error(ArgumentError)
    end

    it 'initializes with a value' do
        node = Node.new('abc')
        expect(node.value).to eql('abc')
        expect(node.parent).to eql(nil)
        expect(node.left_child).to eql(nil)
        expect(node.right_child).to eql(nil)
    end
end
