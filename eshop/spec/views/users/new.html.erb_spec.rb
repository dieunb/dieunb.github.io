require 'rails_helper'

RSpec.describe "users/new.html.erb", type: :view do
  it "displays sign up form" do
    assign(:user, User.new)

    render

    expect(rendered).to match(/email/)
    expect(rendered).to match(/password/)
    expect(rendered).to match(/password_confirmation/)
  end
end
