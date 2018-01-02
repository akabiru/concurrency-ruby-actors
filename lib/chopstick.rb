##
# Mutex wrapper
# Ensure philosophers can not grab the same chopstick at the same time
class Chopstick
  def initialize
    @mutex = Mutex.new
  end

  def take
    mutex.lock
  end

  def drop
    mutex.unlock
  rescue ThreadError
    puts "Trying to drop a chopstick not acquired"
  end

  def in_use?
    mutex.locked?
  end

  private attr_reader :mutex
end
