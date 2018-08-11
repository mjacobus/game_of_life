require 'spec_helper'

RSpec.describe GameOfLife::Alive do
  describe '#alive?' do
    it 'return true' do
      expect(subject).to be_alive
    end
  end
end
