require 'rails_helper'

RSpec.describe "mosques/new", type: :view do
  before(:each) do
    assign(:mosque, Mosque.new())
  end

  it "renders new mosque form" do
    render

    assert_select "form[action=?][method=?]", mosques_path, "post" do
    end
  end
end
