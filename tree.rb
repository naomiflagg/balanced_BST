class Tree
  require_relative('node.rb')
  
  attr_accessor :ary

  def initialize(ary)
    build_tree(clean_array(ary))
  end

  def build_tree(array)
    return nil if array.size.zero?

    mid = array.size / 2
    root = Node.new(array[mid])
    return root if array.size == 1

    root.left = build_tree(array[0..mid - 1])
    root.right = build_tree(array[mid + 1..-1])
    @root = root
  end

  def clean_array(ary)
    ary = ary.uniq.sort
  end

  def insert(value, root = @root)
    return Node.new(value) if root.nil?

    return if value == root.value

    if value < root.value
      root.left = insert(value, root.left)
    else
      root.right = insert(value, root.right)
    end
    root
  end

  def delete(value, root = @root)
    return root if root.nil?

    if value < root.value
      root.left = delete(value, root.left)
    elsif value > root.value
      root.right = delete(value, root.right)
    else
      # Node is leaf or has only one child
      if root.left.nil?
        temp = root.right
        root = nil
        return temp
      elsif root.right.nil?
        temp = root.left
        root = nil
        return temp
      end
      temp = min_value_node(root.right)
      root.value = temp.value
      root.right = delete(temp.value, root.right)
    end
    root
  end

  def min_value_node(node)
    while node.left
      node = node.left
    end
    node
  end

  def find(value)
    pointer = @root
    until pointer.value == value
      pointer = pointer.value > value ? pointer.right : pointer.left
    end
    pointer
  end

  def level_order(root = @root)
    values = []
    q = [root]
    pointer = root
    until q.empty?
      # Enqueue child nodes to q if not nil
      pointer.left.nil? || q << pointer.left
      pointer.right.nil? || q << pointer.right
      # Dequeue first element of q and add to values array
      values << q.shift.value
      pointer = q.first
    end
    values
  end

  def level_order_rec(root = @root, q = [@root], values = [])
    return values if q.empty?

    root.left.nil? || q << root.left
    root.right.nil? || q << root.right
    values << q.shift.value

    level_order_rec(q.first, q, values)
  end

  def inorder(root = @root, values = [])
    return if root.nil?

    inorder(root.left, values)
    values.push(root.value)
    inorder(root.right, values)
    values
  end

  def preorder(root = @root, values = [])
    return if root.nil?

    values.push(root.value)
    preorder(root.left, values)
    preorder(root.right, values)
    values
  end

  def postorder(root = @root, values = [])
    return if root.nil?

    postorder(root.left, values)
    postorder(root.right, values)
    values.push(root.value)
  end

  def height(node)
    return -1 if node.nil?

    1 + [height(node.left), height(node.right)].max
  end

  def depth(node, root = @root, depth = 0)
    return if root.nil?

    return depth if node == root.value

    depth += 1
    if node > root.value
      depth(node, root.right, depth) 
    else
      depth(node, root.left, depth)
    end
  end

  def balanced?(root = @root)
    return true if root.nil?

    ((height(root.left) - height(root.right)).abs <= 1) && balanced?(root.left) && balanced?(root.right)
  end

  def rebalance
    build_tree(inorder)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
