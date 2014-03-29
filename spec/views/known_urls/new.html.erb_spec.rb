require 'spec_helper'

describe "known_urls/new" do
  before(:each) do
    assign(:known_url, stub_model(KnownUrl,
      :url => "MyText",
      :customer_id => 1,
      :partial_id => 1
    ).as_new_record)
  end

  it "renders new known_url form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", known_urls_path, "post" do
      assert_select "textarea#known_url_url[name=?]", "known_url[url]"
      assert_select "input#known_url_customer_id[name=?]", "known_url[customer_id]"
      assert_select "input#known_url_partial_id[name=?]", "known_url[partial_id]"
    end
  end
end
