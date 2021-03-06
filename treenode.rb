class TreeNode
  attr_accessor :parent, :children, :value
  def initialize(value, parent=nil)
    @parent = parent
    @children = []
    @value = value
  end

  def to_s
    return "TreeNode:: Value: #{self.value}, " +
      "Parent Value: #{parent ? parent.value : "No Parent"}, " +
      " Child Values: #{children.map {|child| [child.value.join(", ")]}}"
  end

  def add_child(child_node)
    child_node.parent && child_node.parent.remove_child(child_node)
    @children << child_node
    child_node.parent = self
    child_node
  end

  def remove_child(child_node)
    @children.delete(child_node)
    child_node.parent = nil
    nil
  end

  def dfs(value)
    return self if @value == value
    @children.each do |child|
      child_val = child.dfs(value)
      return child_val if child_val
    end
    nil
  end

  def bfs(value)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == value
      queue += current_node.children
    end
    nil
  end

  def path
    if self.parent.nil?
      return [self.value]
    else
      self.parent.path << self.value
    end
  end

end