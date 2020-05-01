require 'enumerables'

RSpec.describe Enumerable do
  let(:array1) { [1, 2, 3, 4] }
  let(:array2) { %w[two three ten twelve] }
  let(:array3) { [1, 4, nil, 8] }
  let(:array4) { [false, nil, nil, false] }
  let(:array5) { [1, 2, 3, 2, 5, 2] }
  let(:range) { (1..5) }
  describe '#my_each' do
    it 'should raise error when argument given' do
      expect { array1.my_each('a') }.to raise_error(ArgumentError)
    end

    context 'when block given' do
      let(:new_array1) { [] }
      let(:new_array2) { [] }

      it 'should call block with one argument, the item (element), for each collection item' do
        array2.my_each { |ele| new_array1.push(ele + '!') }
        range.my_each { |ele| new_array2.push(ele + 2) }
        expect(new_array1).to eq(%w[two! three! ten! twelve!])
        expect(new_array2).to eq([3, 4, 5, 6, 7])
      end
    end

    context 'when no block is given' do
      it 'should return an Enumerator ' do
        expect(array1.my_each).to be_a_kind_of(Enumerator)
        expect(array1.my_each.to_a).to eq(array1)
      end
    end
  end

  describe '#my_each_with_index' do
    it 'should raise an error when an argument is given' do
      expect { array1.my_each_with_index(1) }.to raise_error(ArgumentError)
    end

    context 'when block given' do
      let(:hash) { {} }
      it 'should call block with two arguments, the item and its index for each collection item' do
        array2.my_each_with_index { |ele, idx| hash[ele] = idx }
        expect(hash).to eq({ 'ten' => 2, 'three' => 1, 'twelve' => 3, 'two' => 0 })
      end
    end

    context 'when no block is given' do
      it 'should return an Enumerator' do
        expect(array1.my_each_with_index).to be_a_kind_of(Enumerator)
        expect(array1.my_each_with_index.to_a).to eq(array1)
      end
    end
  end

  describe '#my_select' do
    it 'should raise an error when an argument is given' do
      expect { array1.my_select(1) }.to raise_error(ArgumentError)
    end

    context 'when block given' do
      it 'should return an array of all collection items that evaluate to true' do
        expect(range.my_select { |ele| ele > 2 }).to eq([3, 4, 5])
        expect(array2.my_select { |ele| ele.size > 3 }).to eq(%w[three twelve])
      end
    end

    context 'when no block is given' do
      it 'should return an Enumerator' do
        expect(array1.my_select).to be_a_kind_of(Enumerator)
        expect(array1.my_select.to_a).to eq(array1)
      end
    end
  end

  describe '#my_all?' do
    context 'when no block is given' do
      context 'if none of elements is (false) or (nil)' do
        it 'should return true' do
          expect(array2.my_all?).to be true
        end
      end

      context 'if at least one or more elements is (false) or (nil)' do
        it 'should return false' do
          expect(array3.my_all?).to be false
        end
      end
    end

    context 'when block given' do
      it 'should return true if all of the collection items evaluate to true' do
        expect(array5.my_all? { |ele| ele >= 1 }).to be true
        expect(range.my_all? { |ele| ele.is_a?(Numeric) }).to be true
      end

      it 'should return false if any of the collection items evaluates to false' do
        expect(array3.my_all? { |ele| ele.is_a?(Integer) }).to be false
        expect(range.my_all? { |ele| ele < 3 }).to be false
      end
    end

    context 'when pattern is given as argument' do
      it 'should return true if pattern === each element in collection' do
        expect(array1.my_all?(Integer)).to be true
        expect(array2.my_all?(/t/)).to be true
      end

      it 'should return false if pattern doesn\'t match each element in collection' do
        expect(array3.my_all?(Integer)).to be false
        expect(array1.my_all?(/e/)).to be false
      end
    end
  end

  describe '#my_any?' do
    context 'when no block is given' do
      context 'if  atleast one of elements is not (false) or (nil)' do
        it 'should return true' do
          expect(array3.my_any?).to be true
        end
      end

      context 'if none of the elements is not (false) or (nil)' do
        it 'should return false' do
          expect(array4.my_any?).to be false
        end
      end
    end

    context 'when block given' do
      it 'should return true if any of the collection items evaluates to true' do
        expect(array5.my_any? { |ele| ele == 3 }).to be true
        expect(range.my_any? { |ele| ele > 4 }).to be true
      end

      it 'should return false if none of the collection items evaluates to true' do
        expect(array2.my_any? { |ele| ele.size > 6 }).to be false
        expect(range.my_any? { |ele| ele > 5 }).to be false
      end
    end

    context 'when pattern is given as argument' do
      it 'should return true if pattern === any element in collection' do
        expect(array3.my_any?(nil)).to be true
        expect(array2.my_any?(/o/)).to be true
      end

      it 'should return false if pattern doesn\'t match any element in collection' do
        expect(array2.my_any?(Integer)).to be false
        expect(array2.my_any?(/s/)).to be false
      end
    end
  end

  describe '#my_none?' do
    context 'when no block is given' do
      context 'if none of the elements is not (false) or (nil)' do
        it 'should return true' do
          expect(array4.my_none?).to be true
        end
      end

      context 'if  atleast one of elements is not (false) or (nil)' do
        it 'should return false' do
          expect(array3.my_none?).to be false
        end
      end
    end

    context 'when block given' do
      it 'should return true if none of the collection items evaluates to true' do
        expect(array5.my_none? { |ele| ele == 4 }).to be true
        expect(range.my_none? { |ele| ele > 5 }).to be true
      end

      it 'should return false if any of the collection items evaluates to true' do
        expect(array5.my_none? { |ele| ele == 3 }).to be false
        expect(range.my_none? { |ele| ele > 4 }).to be false
      end
    end

    context 'when pattern is given as argument' do
      it 'should return true if pattern doesn\'t match any element in collection' do
        expect(array3.my_none?(String)).to be true
        expect(array2.my_none?(/s/)).to be true
      end

      it 'should return false if pattern === any element in collection' do
        expect(array3.my_none?(nil)).to be false
        expect(array2.my_none?(/o/)).to be false
      end
    end
  end

  describe '#my_count' do
    context 'when block given' do
      it 'counts number of collection items yielding a true value' do
        expect(array5.my_count { |ele| ele == 2 }).to eq(3)
        expect(array1.my_count { |ele| ele > 2 }).to eq(2)
      end
    end

    context 'when no block is given' do
      it 'should return number of items in collection' do
        expect(array2.count).to eq(4)
        expect(array4.count).to eq(4)
      end
    end

    context 'when argument is given' do
      it 'should return number of items in collection that are equal to argument' do
        expect(array5.my_count(2)).to eq(3)
      end
    end
  end

  describe '#my_map' do
    context 'when block given' do
      it 'should return a new array with results of running block once for every collection item' do
        expect(array1.my_map { |ele| ele + 1 }).to eq([2, 3, 4, 5])
        expect(range.my_map { |ele| ele + 2 }).to eq([3, 4, 5, 6, 7])
        expect(range.my_map { 'cat' }).to eq(%w[cat cat cat cat cat])
      end
    end

    context 'when no block is given' do
      it 'should return an Enumerator ' do
        expect(array1.my_map).to be_a_kind_of(Enumerator)
        expect(array1.my_map.to_a).to eq(array1)
      end
    end
  end

  describe '#my_inject' do
    context 'when block is given' do
      context 'when no initial value is specified' do
        it 'should combine all collection items by applying a binary operation' do
          expect(range.my_inject { |acc, num| acc + num }).to eq(15)
          expect(array1.my_inject { |acc, num| acc + num }).to eq(10)
          expect(array1.my_inject { |acc, num| acc * num }).to eq(24)
          expect(array2.my_inject { |acc, num| acc + num }).to eq('twothreetentwelve')
        end
      end

      context 'when initial value is specified' do
        it 'should combine all collection items with binary operation starting with specified initial value' do
          expect(range.my_inject(2) { |acc, num| acc + num }).to eq(17)
          expect(array1.my_inject(2) { |acc, num| acc + num }).to eq(12)
          expect(array1.my_inject(5) { |acc, num| acc * num }).to eq(120)
        end
      end
    end

    context 'when no block is given' do
      context 'when only symbol is specified as argument' do
        it 'should combine all collection items using symbol specified' do
          expect(array1.my_inject(:+)).to eq(10)
          expect(range.my_inject(:+)).to eq(15)
          expect(array1.my_inject(:*)).to eq(24)
        end
      end

      context 'when initial value and symbol are specified as arguments' do
        it 'should combine all collection items begining with initial value using symbol specified' do
          expect(array1.my_inject(2, :+)).to eq(12)
          expect(range.my_inject(2, :+)).to eq(17)
          expect(array1.my_inject(5, :*)).to eq(120)
        end
      end
    end
  end
end
