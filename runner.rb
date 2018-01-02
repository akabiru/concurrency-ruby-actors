require_relative 'lib/chopstick.rb'
require_relative 'lib/philosopher'
require_relative 'lib/table'

names = %w(Heraclitus Aristotle Epictetus Schopenhauer Popper)

philosophers = names.map { |name| Philosopher.new(name) }
table        = Table.new(philosophers.size)

threads = philosophers.map.with_index do |philosopher, i|
  Thread.new { philosopher.dine(table, i) }
end

threads.each(&:join)
sleep
