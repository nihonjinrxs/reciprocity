require 'rails_helper'

RSpec.describe "interactions/index", type: :view do
  before(:each) do
    assign(:interactions, [
      Interaction.create!(
        :reciprocator => nil,
        :listing => nil
      ),
      Interaction.create!(
        :reciprocator => nil,
        :listing => nil
      )
    ])
  end

  it "renders a list of interactions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
