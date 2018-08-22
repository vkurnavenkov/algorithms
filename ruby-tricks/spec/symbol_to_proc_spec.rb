require 'rspec'
require File.expand_path('../../symbol_to_proc', __FILE__)
# require 'symbol_to_proc'

RSpec.describe Symbol do
  RSpec.context 'to_proc' do
    RSpec.context 'reduce' do
      it 'sums enum' do
        expect((1..10).reduce(&:+)).to eql(55)
      end

      it 'multiples enum' do
        expect((1..10).reduce(&:*)).to eql(3628800)
      end
    end

    RSpec.context 'each' do
      it 'returns enum' do
        expect((1..10).to_proc(&:*)).to eql(1..10)
      end
    end
  end

  it 'returns true' do
    expect(1).to eql(2)
  end
end
