require 'spec_helper'

describe Post do
  subject { build :post }

  context 'validations' do
    it { should validate_length_of(:content).is_at_most(150) }
    it { should validate_presence_of(:content) }
  end
end
