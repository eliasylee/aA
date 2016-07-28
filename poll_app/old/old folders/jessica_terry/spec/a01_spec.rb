require 'rspec'
require 'spec_helper'
require 'a01'

describe "#bubble_sort" do
  # write a new `Array#bubble_sort` method; it should not modify the
  # array it is called on, but creates a new sorted array.
  let(:array) { [1, 2, 3, 4, 5].shuffle }

  it "works with an empty array" do
    expect([].bubble_sort).to eq([])
  end

  it "works with an array of one item" do
    expect([1].bubble_sort).to eq([1])
  end

  it "sorts numbers" do
    expect(array.bubble_sort).to eq(array.sort)
  end

  it "will use block if given" do
    sorted = array.bubble_sort do |num1, num2|
      # order numbers based on descending sort of their squares
      num2**2 <=> num1**2
    end

    expect(sorted).to eq([5, 4, 3, 2, 1])
  end

  it "does not modify original" do
    duped_array = array.dup
    duped_array.bubble_sort
    expect(duped_array).to eq(array)
  end
end

describe "#dups" do
  # Write a new Array method (using monkey-patching) that will return
  # the location of all identical elements. The keys are the
  # duplicated elements, and the values are arrays of their positions,
  # sorted lowest to highest.

  it "solves a simple example" do
    expect([1, 3, 0, 1].dups).to eq({ 1 => [0, 3] })
  end

  it "finds two dups" do
    expect([1, 3, 0, 3, 1].dups).to eq({ 1 => [0, 4], 3 => [1, 3] })
  end

  it "finds multi-dups" do
    expect([1, 3, 4, 3, 0, 3].dups).to eq({ 3 => [1, 3, 5] })
  end

  it "returns {} when no dups found" do
    expect([1, 3, 4, 5].dups).to eq({})
  end
end

describe "#fibs_rec" do
  # write a recursive implementation of a method that returns the
  # first `n` fibonacci numbers.

  it "returns first fibonacci number" do
    expect(fibs_rec(1)).to eq([0])
  end

  it "returns first two fib numbers" do
    expect(fibs_rec(2)).to eq([0, 1])
  end

  it "returns many fibonacci numbers" do
    expect(fibs_rec(6)).to eq([0, 1, 1, 2, 3, 5])
  end

  it "calls itself recursively" do
    expect(self).to receive(:fibs_rec).at_least(:twice).and_call_original
    fibs_rec(6)
  end
end

describe "#symmetric_substrings" do
  # Write a `String#symmetric_substrings` method that takes a returns
  # substrings which are equal to their reverse image ("abba" ==
  # "abba"). We should only include substrings of length > 1.

  it "handles a simple example" do
    expect("aba".symmetric_substrings).to match_array(["aba"])
  end

  it "handles two substrings" do
    expect("aba1cdc".symmetric_substrings).to match_array(["aba", "cdc"])
  end

  it "handles nested substrings" do
    expect("xabax".symmetric_substrings).to match_array(["aba", "xabax"])
  end
end

# This method returns the largest factor of
# the number that is prime.
describe 'largest_prime_factor' do
  it 'returns 2 for 2' do
    expect(largest_prime_factor(2)).to eq(2)
  end

  it 'returns 5 for 10' do
    expect(largest_prime_factor(10)).to eq(5)
  end
  it 'can detect larger factors' do
    expect(largest_prime_factor(152)).to eq(19)
  end
  it 'can detect even larger factors' do
    expect(largest_prime_factor(2098)).to eq(1049)
  end

  it "returns original number if it is prime" do
    expect(largest_prime_factor(13)).to eq(13)
  end

  it 'returns nil for zero and one' do
    expect(largest_prime_factor(0)).to be_nil
    expect(largest_prime_factor(1)).to be_nil
  end
end

describe 'Array#my_each' do
  it 'calls the block passed to it' do
    expect do |block|
      ["test array"].my_each(&block)
    end.to yield_control.once
  end

  it 'yields each element to the block' do
    expect do |block|
      ["el1", "el2"].my_each(&block)
    end.to yield_successive_args("el1", "el2")
  end

  it 'does NOT call the Array#each method' do
    original_array = ["original array"]
    expect(original_array).not_to receive(:each)
    original_array.my_each {}
  end

  it 'is chainable and returns the original array' do
    original_array = ["original array"]
    expect(original_array.my_each {}).to eq(original_array)
  end
end

describe 'Array#my_all?' do
  it 'calls the block passed to it' do
    expect do |block|
      [true].my_all?(&block)
    end.to yield_control
  end

  it 'returns false if any call to the block evaluates to a falsey value' do
    expect([true, false, true].my_all? { |el| el }).to eq(false)
    expect([true, nil, true].my_all? { |el| el }).to eq(false)
  end

  it 'returns true if every call to the block evaluates to true' do
    expect([2, 4, 6].my_all? { |el| el.even? }).to eq(true)
  end

  it 'returns true if every call to the block evaluates to truthy values' do
    expect([:a, :b, :c].my_all? { |el| el }).to eq(true)
  end

  it 'does NOT call the built-in Array#all?, #none?, #any?' do
    test_array = ["el1", "el2", "el3"]

    [:all?, :none?, :any?].each do |method|
      expect(test_array).not_to receive(method)
    end

    test_array.my_all? {}
  end
end

