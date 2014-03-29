require 'spec_helper'

describe "partials/show" do
  before(:each) do
    @partial = assign(:partial, stub_model(Partial,
      :f_customer_id => 1,
      :s_customer_id => 2,
      :t_customer_id => 3,
      :partial_html => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/MyText/)
  end
end
