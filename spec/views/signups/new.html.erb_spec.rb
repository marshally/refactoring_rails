require 'rails_helper'

RSpec.describe "signups/new", :type => :view do
  before(:each) do
    assign(:signup, Signup.new(
      :login => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new signup form" do
    render

    assert_select "form[action=?][method=?]", signups_path, "post" do

      assert_select "input#signup_login[name=?]", "signup[login]"

      assert_select "input#signup_email[name=?]", "signup[email]"
    end
  end
end
