require 'spec_helper'

RSpec.describe GameOfLife::Dead do
  describe '#alive?' do
    it 'return true' do
      expect(subject).not_to be_alive
    end
  end
end
