require_relative 'bike'
class DockingStation
  attr_reader :bike

  def release_bike
    @bike
  end

  def dock(bike)
    # fail 'Docking station full' if @bike
    @bike = bike
  end
end
