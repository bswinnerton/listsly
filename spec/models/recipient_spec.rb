require 'spec_helper'

describe Recipient do
  it { should belong_to(:user) }
end
