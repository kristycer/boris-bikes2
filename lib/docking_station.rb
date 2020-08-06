require_relative 'bike'
class DockingStation
  attr_reader :bikes, :capacity, :broken_bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @broken_bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike, broken = false)
    fail 'Docking station full' if full?
    broken ? @broken_bikes << bike : @bikes << bike
  end

  private 

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end 

  def empty?
    @bikes.empty?
  end


end
