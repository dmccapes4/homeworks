class Stack
  attr_reader :stack

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
    @stack
  end
end
