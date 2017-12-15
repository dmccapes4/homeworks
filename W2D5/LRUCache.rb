class LRUCache
    def initialize(el)
      @list = LinkedList.new(Node.new(el))
    end

    def count
      @list.length
    end

    def add(el)
      if @list.find(el)
        move_to_front(el)
      else
        @list.prepend(el)
      end
      @list.pop if count > 4
    end

    def show
      @list.display
    end

    private
    def move_to_front(el)
      node = @list.find(el)
      if node
        node.prev_node.next_node = node.next_node
        node.next_node.prev_node = node.prev_node
        @list.start_node.prev_node = node
        node.next_node = @list.start_node
        node.prev_node = nil
        @list.start_node = node
      end
    end

  end

  class LinkedList
    attr_accessor :start_node, :end_node

    def initialize(node = nil)
      @start_node = node
      @end_node = node
    end

    def append(el)
      node = Node.new(el)
      @end_node.next_node = node
      node.next_node = nil
      node.prev_node = @end_node
      @end_node = node
    end

    def prepend(el)
      node = Node.new(el)
      @start_node.prev_node = node
      node.next_node = @start_node
      node.prev_node = nil
      @start_node = node
    end

    def find(el)
      node = @start_node
      until node.next_node.nil?
        return node if node.el == el
        node = node.next_node
      end
      false
    end

    def length
      out = 0
      node = @start_node
      until node.next_node.nil?
        out += 1
        node = node.next_node
      end
      out
    end

    def pop
      @end_node = @end_node.prev_node
      @end_node.next_node = nil
    end

    def display
      out = []
      node = @start_node
      until node.nil?
        out << node.el
        node = node.next_node
      end
      print out.reverse
    end
  end

  class Node
    attr_accessor :el, :next_node, :prev_node

    def initialize(el)
      @el = el
      @next_node = next_node
    end

    def to_s
      @el
    end
  end
