require 'rails_helper'

RSpec.describe "mosques/show", type: :view do
  before(:each) do
    assign(:mosque, Mosque.create!(name: "Test Mosque", description: "A mosque for testing purposes"))
  end

  it "renders attributes in <p>" do
    render
  end
end
