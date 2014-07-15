class LinkedList
  attr_reader :current_item
  attr_accessor :size
  attr_accessor :temp_item


  def initialize(*payload_string)
    @size = 0
    if(payload_string)
      payload_string.each do |payload|
        push(payload)
      end
    end
  end

  def find_by_index(index)
    raise IndexError if index < 0
    current_item = @first_item
    index.times do
      current_item = current_item.next_item
    end
    current_item
  end

  def sort!
    "|  |"
  end

  def swap_with_next (index)
    raise IndexError if index >= size - 1
    current = find_by_index(index)
    current_next = find_by_index(index + 1)
    next_next = find_by_index(index + 2)
    if index > 0
      previous_item = find_by_index(index - 1)
      previous_item.next_item = current_next
      current_next.next_item = current
      current.next_item = next_next
    else
      @first_item = current_next
      @first_item.next_item = current
      current.next_item = next_next
    end
  end

  def sorted?
    sorted = true
    count = 0
    current_item = @first_item
    while count < (size - 1)
      return true if size == 1
      return true if current_item == current_item.next_item
      if current_item > current_item.next_item
        sorted = false
      end
      current_item = current_item.next_item
      count += 1
    end
    sorted
  end

  def index (string_value)
    count = 0
    current_item = @first_item
    while count < size
      return count if current_item.payload == string_value
      current_item = current_item.next_item
      count += 1
    end
    if count == size
      nil
    else
      count
    end
  end

  def delete (index)
    raise IndexError if index < 0
    @size -= 1
    current_item = @first_item
    raise IndexError if get(index) == nil
    if index == 0

      @first_item = current_item.next_item
    else

      previous_item = find_by_index(index-1)
      new_next_item = find_by_index(index+1)
      previous_item.next_item = new_next_item
    end
  end

  def [] (index)
    get(index)
  end

  def []= (index, new_payload)
    raise IndexError if index < 0
    current_item = @first_item
    index.times do
      current_item = current_item.next_item
    end
    current_item.payload = new_payload
  end

  def to_s
    stringythingy = []
    if @first_item != nil

      current_item = @first_item
      until current_item == nil
        stringythingy.push(current_item.payload)
        current_item = current_item.next_item
      end
      if stringythingy.size >= 2
        stringythingy = stringythingy.join(", ")
        "| #{stringythingy} |"
      else
        "| #{stringythingy[0]} |"
      end
    else
      stringythingy =  "| |"
    end

  end

  def push(value)
    @size += 1
    lli = LinkedListItem.new(value)

    if @first_item

      current_item = @first_item
      until current_item.last?
        current_item = current_item.next_item
      end
       current_item.next_item = lli

    else
      @first_item = lli
    end
  end

  def get(index)
    if index > -1
      current_item = @first_item
      index.times do
      if current_item == nil
        raise IndexError
      end
        current_item = current_item.next_item

      end

      current_item.payload

    else
      raise IndexError
    end
  end

  def last
    if @first_item != nil
      current_item = @first_item
      until current_item.next_item == nil
        current_item = current_item.next_item
      end
      current_item.payload
    else
      current_item
    end
  end

  private

  def last_item
    current_item = @first_item
    until current_item.last?
      current_item = current_item.next_item
    end
    current_item
  end



end
