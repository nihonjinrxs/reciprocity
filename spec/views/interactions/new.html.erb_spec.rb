require 'rails_helper'

RSpec.describe "interactions/new", type: :view do
  before(:each) do
    assign(:interaction, Interaction.new(
      :reciprocator => nil,
      :listing => nil
    ))
  end

  it "renders new interaction form" do
    render

    assert_select "form[action=?][method=?]", interactions_path, "post" do

      assert_select "input[name=?]", "interaction[reciprocator_id]"

      assert_select "input[name=?]", "interaction[listing_id]"
    end
  end
end
