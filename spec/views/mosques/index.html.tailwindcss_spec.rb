require 'rails_helper'

RSpec.describe "mosques/index", type: :view do
  before(:each) do
    assign(:mosques, [
      Mosque.create!(name: "Test Mosque 1", description: "A mosque for testing purposes 1"),
      Mosque.create!(name: "Test Mosque 2", description: "A mosque for testing purposes 2")
    ])
  end

  it "renders a list of mosques" do
    render
    cell_selector = 'div>p'
  end
end
