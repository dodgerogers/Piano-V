require 'spec_helper'

describe "posts/index" do
  before(:each) do
    assign(:posts, [
      stub_model(Post,
        :user_id => 1,
        :song_name => "Song Name",
        :song => "Song"
      ),
      stub_model(Post,
        :user_id => 1,
        :song_name => "Song Name",
        :song => "Song"
      )
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Song Name".to_s, :count => 2
    assert_select "tr>td", :text => "Song".to_s, :count => 2
  end
end
