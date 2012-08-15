require "spec_helper"

describe Rating do
  before(:each) do
    @rate = FactoryGirl.create(:rating)
  end
  
  subject { @rate }
  
  it { should respond_to(:post) }
  it { should respond_to(:user) }
  it { should respond_to(:rating) }
  it { should respond_to(:post_id) }
  
  it { should be_valid }
  
  describe "with no user id" do
    before { @rate.user_id = nil }
    it { should_not be_valid }
  end
  
  describe " with no post id " do
    before { @rate.post_id = nil }
    it { should_not be_valid }
  end
end