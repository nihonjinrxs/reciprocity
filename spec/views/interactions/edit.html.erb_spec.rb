require 'rails_helper'

RSpec.describe "interactions/edit", type: :view do
  before(:each) do
    @interaction = assign(:interaction, Interaction.create!(
      :reciprocator => nil,
      :listing => nil
    ))
  end

  it "renders the edit interaction form" do
    render

    assert_select "form[action=?][method=?]", interaction_path(@interaction), "post" do

      assert_select "input[name=?]", "interaction[reciprocator_id]"

      assert_select "input[name=?]", "interaction[listing_id]"
    end
  end
end
