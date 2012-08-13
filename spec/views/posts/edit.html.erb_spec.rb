require 'spec_helper'

describe "posts/edit" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :user_id => 1,
      :song_name => "MyString",
      :song => "MyString"
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path(@post), :method => "post" do
      assert_select "input#post_user_id", :name => "post[user_id]"
      assert_select "input#post_song_name", :name => "post[song_name]"
      assert_select "input#post_song", :name => "post[song]"
    end
  end
end
