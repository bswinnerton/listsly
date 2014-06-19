require 'spec_helper'

describe Email do
  it { should belong_to(:conversation) }
  it { should belong_to(:sender) }
  it { should belong_to(:recipient) }
end
