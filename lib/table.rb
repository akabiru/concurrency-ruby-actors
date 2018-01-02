require_relative 'chopstick'

##
# Geometry of the table
# location of every seat
# chopsticks postions; relative
class Table
  def initialize(num_seats)
    @chopsticks = num_seats.times.map { Chopstick.new }
  end

  def left_chopstick_at(pos)
    chopstick_at(pos - 1)
  end

  def right_chopstick_at(pos)
    chopstick_at(pos)
  end

  def chopsticks_in_use
    chopsticks.select(&:in_use?).size
  end

  private

  attr_reader :chopsticks

  def chopstick_at(position)
    index = position % chopsticks.size
    chopsticks[index]
  end
end
