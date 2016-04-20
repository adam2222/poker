require 'rspec'
require 'dups'
require 'byebug'

describe '#my_uniq' do
  subject(:array) { [1, 2, 1, 3, 3] }

  it "recieves an array" do
    expect(array).to receive(:my_uniq)
    array.my_uniq
  end

  it "returns unique elements in order in which they first appeared" do
    expect(array.my_uniq).to eq([1, 2, 3])
  end
end

describe '#two_sum' do

  it "receives an array" do
    array = Array.new
    expect(array).to receive(:two_sum)
    array.two_sum
  end

  it 'returns pairs of indexes which sum to zero' do
    expect([1, -1].two_sum).to eq([[0, 1]])
  end

  it 'returns pairs of indexes which sum to zero' do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end

  it 'returns [] when no pairs found' do
    expect([0, 2, 5, 1, 3].two_sum).to eq([])
  end

  it 'returns pairs when multiple of the same numbers exist' do
    expect([2, -2, 2, -2].two_sum).to eq([[0,1], [0,3], [1, 2], [2, 3]])
  end

end

describe '#my_transpose' do

  it "receives an array" do
    array = Array.new
    expect(array).to receive(:my_transpose)
    array.my_transpose
  end

  it "returns an empty array if given an empty array" do
    expect([].my_transpose).to eq([])
  end

  it "works on a 1x1 array" do
    expect([[1]].my_transpose).to eq([[1]])
  end

  it "works on a 2x2 array" do
    array = [
      [3, 2],
      [0, 7]
    ]

    array2 = [
      [3, 0],
      [2, 7]
    ]

    expect(array.my_transpose).to eq(array2)
  end

  it "works on a 3x3 array" do
    array = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]

    array2 = [
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ]

    expect(array.my_transpose).to eq(array2)
  end

end

describe '#stock_picker' do

  subject(:array) { [5, 4, 3, 1, 4] }
  it 'takes an array' do
    # array = Array.new
    expect(array).to receive(:stock_picker)
    array.stock_picker
  end

  it 'expects an array with less than two days to return nil' do
    expect([1].stock_picker).to eq(nil)
  end

  it 'expects buying day to be before selling day' do
    expect(array.stock_picker[0]).to be < array.stock_picker[1]
  end

  it 'returns greatest profit between 2 days' do
    expect(array.stock_picker).to eq([3 , 4])
  end

end
