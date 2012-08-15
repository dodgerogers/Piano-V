require 'spec_helper'

describe Post do
  before(:each) do
      @post = FactoryGirl.create(:post) 
    end
  
  subject { @post }
  
  it { should respond_to(:user) }
  it { should respond_to(:song_name) }
  it { should respond_to(:song) }
  it { should respond_to(:user_id) }
  it { should respond_to(:rating) }
  
  it { should be_valid }
  
  describe " with no user_id" do
    before { @post.user_id = nil }
    it {should_not be_valid }
  end
  
  describe "with blank song name" do
    before { @post.song_name = "" }
    it { should_not be_valid }
  end
  
  describe "with blank song" do
    before { @post.song = "" }
    it { should_not be_valid }
  end
  
  describe "with song thats too long" do
    before { @post.song = ( 'a' * 10001) }
    it { should_not be_valid }
  end
end  
