require 'spec_helper'

describe "partials/new" do
  before(:each) do
    assign(:partial, stub_model(Partial,
      :f_customer_id => 1,
      :s_customer_id => 1,
      :t_customer_id => 1,
      :partial_html => "MyText"
    ).as_new_record)
  end

  it "renders new partial form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", partials_path, "post" do
      assert_select "input#partial_f_customer_id[name=?]", "partial[f_customer_id]"
      assert_select "input#partial_s_customer_id[name=?]", "partial[s_customer_id]"
      assert_select "input#partial_t_customer_id[name=?]", "partial[t_customer_id]"
      assert_select "textarea#partial_partial_html[name=?]", "partial[partial_html]"
    end
  end
end
