class CircularBuffer
  class BufferEmptyException < StandardError; end

  class BufferFullException < StandardError; end

  def initialize(size)
    @buffer = Array.new(size)
    @num_of_slots = size
    @write_position = 0
    @oldest_position = 0
  end

  def read
    raise BufferEmptyException if empty?
    result = @buffer[@oldest_position]
    @buffer[@oldest_position] = nil
    increment_oldest_position
    result
  end

  def write(data, overwrite = false)
    return if data.nil?
    raise BufferFullException if full? && !overwrite
    was_full = full?
    @buffer[@write_position] = data
    increment_write_position
    increment_oldest_position if overwrite && was_full
  end

  def write!(data)
    write(data, true)
  end

  def clear
    initialize(@num_of_slots)
  end

  private

  def empty?
    @buffer.all?(&:nil?)
  end

  def full?
    @buffer.all? { |item| !item.nil? }
  end

  def increment_index_of(index)
    index += 1
    index == @num_of_slots ? 0 : index
  end

  def increment_write_position
    @write_position = increment_index_of(@write_position)
  end

  def increment_oldest_position
    @oldest_position = increment_index_of(@oldest_position)
  end
end
