require 'docking_station.rb'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  let(:bike) { double :bike }

  it 'releases a working bike' do
    allow(bike).to receive(:working?).and_return(true)
    subject.dock(bike)
    released_bike = subject.release_bike
    expect(released_bike).to be_working
  end
  
  it { is_expected.to respond_to :bikes }

  # describe '#release_bike' do
  #  it "Release a bike" do
  #   subject.dock double(:bike)
  #   expect(subject.release_bike).to eq bike
   #end

   it { is_expected.to respond_to(:dock).with(1).argument }

   it "raises an error when there are no bikes available" do
    expect {subject.release_bike}.to raise_error "No bikes available"
    end
  end

  describe 'dock' do
    it 'raises an error when full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock double :bike}
      expect { subject.dock double(:bike) }. to raise_error 'Docking station full'
      end
    end

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new}
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
      subject.dock(bike)
      end

      expect{ subject.dock (bike) }. to raise_error 'Docking station full'
    end 
    
  end

