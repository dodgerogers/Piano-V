require "spec_helper"

describe Comment do
  before(:each) do 
    @comment = FactoryGirl.create(:comment) 
  end
  
  subject { @comment }
  
  it { should respond_to(:user)}
  it { should respond_to(:user_id)}
  it { should respond_to(:post_id)}
  it { should respond_to(:content)}
  
  it { should be_valid }
  
  describe "when user id is not present" do
    before { @comment.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "with no post_id" do
    before { @comment.post_id = nil }
    it { should_not be_valid }
  end
  
  describe "with blank content"  do
    before { @comment.content = "" }
    it { should_not be_valid }
  end
  
  describe "with content thats too long" do
    before { @comment.content = ("a" * 301) }
    it { should_not be_valid }
  end
end
