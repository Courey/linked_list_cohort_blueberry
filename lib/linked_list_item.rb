class LinkedListItem
  include Comparable

  attr_accessor :payload
  attr_accessor :next_item



  def initialize(item)
    @payload = item
  end

  def next_item=(other_item)
    if self === other_item
      raise ArgumentError, "You dun fucked something up"
    else
      @next_item = other_item
    end
  end

  def last?
    if @next_item == nil
      true
    else
      false
    end
  end

  def ===(other_item)
    self.equal? other_item
  end

  def <=> (value)
    if self.payload.class == value.payload.class
      self.payload.to_s <=> value.payload.to_s
    else
      precedence = [Fixnum, String, Symbol]
      left = precedence.index(self.payload.class)
      right = precedence.index(value.payload.class)
      left <=> right
    end
  end
end
