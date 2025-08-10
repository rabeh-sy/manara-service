require 'rails_helper'

RSpec.describe "mosques/edit", type: :view do
  let(:mosque) {
    Mosque.create!(name: "Test Mosque", description: "A mosque for testing purposes")
  }

  before(:each) do
    assign(:mosque, mosque)
  end

  it "renders the edit mosque form" do
    render

    assert_select "form[action=?][method=?]", mosque_path(mosque), "post" do
    end
  end
end
