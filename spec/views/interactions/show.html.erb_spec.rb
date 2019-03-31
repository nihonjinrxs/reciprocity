require 'rails_helper'

RSpec.describe "interactions/show", type: :view do
  before(:each) do
    @interaction = assign(:interaction, Interaction.create!(
      :reciprocator => nil,
      :listing => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
