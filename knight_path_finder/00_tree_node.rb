class PolyTreeNode

  def initialize(pos)
    @parent = nil
    @children = []
    @pos = pos
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def pos
    @pos
  end

  def parent=(parent)
    @parent = parent
    unless @parent == nil ||self.parent.children.include?(self)
      self.parent.children << self
    end
  end

  def add_child(child_node)
    unless self.children.include?(child_node)
      child_node.parent = self
      self.children << child_node
    end
  end

  def remove_child(child)
    raise "This child is not this parent's" unless self.children.include?(child)
    self.children.delete(child)
    child.parent = nil
  end

  def dfs(target_pos)
    return self if self.pos == target_pos
    return nil if self.children.empty?
    node_or_nil = nil

    @children.each do |child|
       node_or_nil = child.dfs(target_pos)
    end

    node_or_nil
  end

  def bfs(target_pos)
    queue = [self]

    until queue.empty?
      viewed_node = queue.shift
      return viewed_node if viewed_node.pos == target_pos
      viewed_node.children.each { |child| queue << child }
    end

    nil
  end
end