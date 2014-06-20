require 'spec_helper'

describe Conversation do
  it { should have_many(:messages) }
  it { should validate_presence_of(:name) }
end
