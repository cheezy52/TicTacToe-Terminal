require "treenode"
load "./treenode.rb"
def gen_tree(size)

  tree = []

  size.times do |i|
    tree << TreeNode.new(i)
  end

  assign_parents(tree)
end


def assign_parents(tree)
  scratch_tree = tree.dup
  root = scratch_tree.shift
  current_node = root
  queue = []
  until scratch_tree.empty?
    2.times do
      unless scratch_tree.empty?
        queue << current_node.add_child(scratch_tree.shift)
      end
    end
    current_node = queue.shift
  end
  tree
end
