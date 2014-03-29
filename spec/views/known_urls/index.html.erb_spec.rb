require 'spec_helper'

describe "known_urls/index" do
  before(:each) do
    assign(:known_urls, [
      stub_model(KnownUrl,
        :url => "MyText",
        :customer_id => 1,
        :partial_id => 2
      ),
      stub_model(KnownUrl,
        :url => "MyText",
        :customer_id => 1,
        :partial_id => 2
      )
    ])
  end

  it "renders a list of known_urls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
