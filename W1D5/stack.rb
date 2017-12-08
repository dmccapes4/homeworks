class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.unshift(el)
  end

  def remove
    @stack.shift
  end

  def show
    @stack.first
  end
end
