class Philosopher
  def initialize(name)
    @name = name
  end

  def dine(table, position)
    @chopsticks =
      [table.left_chopstick_at(position), table.right_chopstick_at(position)]

    loop { think; eat }
  end

  def think
    puts "#{@name} is thinking..."
  end

  def eat
    take_chopsticks

    puts "#{@name} is eating..."

    drop_chopsticks
  end

  private

  attr_reader :chopsticks

  def take_chopsticks
    chopsticks.each(&:take)
  end

  def drop_chopsticks
    chopsticks.each(&:drop)
  end
end
