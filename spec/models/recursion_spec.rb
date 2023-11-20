require 'rails_helper'
require 'timeout'

RSpec.describe Recursion, type: :model do
  
  def fib(n)
    return 0 if n == 1
    return 1 if n == 2
    return 1 if n == 3
    return 2 if n == 4

     fib(n-1) + fib(n-2)
end

def fact(n)
  return 1 if n == 1
  return fact(1) * 2  if  n == 2
  return fact(1) * fact(2) * 3 if n == 3

  n * fact(n-1)
end
 
def towers(num_disks, from, to, alt)
  if num_disks == 1
    puts "Moving disk from #{from} to #{to}"
    to.push(from.pop)
  else
    towers(num_disks - 1, from,alt,to)
    towers(1, from, to, alt)
    towers(num_disks -1, alt, to, from)
  end
end

describe 'towers' do
  it 'moves 1 disk' do
    from = [1]
    to = []
    alt = []
    towers(1, from, to, alt)
    expect(from).to eq([])
    expect(to).to eq([1])
    expect(alt).to eq([])
 end

 it 'moves 2 disk' do
  from = [2, 1]
  to = []
  alt = []
  towers(2, from, to, alt)

  expect(from).to eq([])
  expect(to).to eq([2,1])
  expect(alt).to eq([])
end

it 'moves 5 disk' do
  from = [5,4,3,2, 1]
  to = []
  alt = []
  towers(5, from, to, alt)

  expect(from).to eq([])
  expect(to).to eq([5,4,3,2,1])
  expect(alt).to eq([])
 end
end


describe 'fact' do
  it 'works for a simple base-case' do
    expect(fact(1)).to eq(1)
  end 

  it 'works for edge case (n = 1)' do
    expect(fact(1)).to eq(1)
  end
  
  it 'works for a more complex case' do
    expect(fact(4)).to eq(24)
    expect(fact(6)).to eq(720)
 end
end

describe 'fib' do
    it 'works for a simple base-case' do
      expect(fib(1)).to eq(0)
      expect(fib(2)).to eq(1)
      expect(fib(3)).to eq(1)
    end 

    it 'works for a fourth base-case' do
      expect(fib(4)).to eq(2)
    end 

    it 'works for a simple base-case' do
      expect(fib(5)).to eq(3)
      expect(fib(7)).to eq(8)
      expect(fib(10)).to eq(34)
    end 

    it 'works for edge case (n = 1)' do
      expect(fib(1)).to eq(0)
    end

    it 'works for edge case (n = 2)' do
      expect(fib(2)).to eq(1)
    end 

    it 'works for a more complex case' do
      expect(fib(6)).to eq(5)
      expect(fib(9)).to eq(21)
      expect(fib(12)).to eq(89)
    end 
  end
end