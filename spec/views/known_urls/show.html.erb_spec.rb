require 'spec_helper'

describe "known_urls/show" do
  before(:each) do
    @known_url = assign(:known_url, stub_model(KnownUrl,
      :url => "MyText",
      :customer_id => 1,
      :partial_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
