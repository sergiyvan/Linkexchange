require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PartialsController do

  # This should return the minimal set of attributes required to create a valid
  # Partial. As you add validations to Partial, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "f_customer_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PartialsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all partials as @partials" do
      partial = Partial.create! valid_attributes
      get :index, {}, valid_session
      assigns(:partials).should eq([partial])
    end
  end

  describe "GET show" do
    it "assigns the requested partial as @partial" do
      partial = Partial.create! valid_attributes
      get :show, {:id => partial.to_param}, valid_session
      assigns(:partial).should eq(partial)
    end
  end

  describe "GET new" do
    it "assigns a new partial as @partial" do
      get :new, {}, valid_session
      assigns(:partial).should be_a_new(Partial)
    end
  end

  describe "GET edit" do
    it "assigns the requested partial as @partial" do
      partial = Partial.create! valid_attributes
      get :edit, {:id => partial.to_param}, valid_session
      assigns(:partial).should eq(partial)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Partial" do
        expect {
          post :create, {:partial => valid_attributes}, valid_session
        }.to change(Partial, :count).by(1)
      end

      it "assigns a newly created partial as @partial" do
        post :create, {:partial => valid_attributes}, valid_session
        assigns(:partial).should be_a(Partial)
        assigns(:partial).should be_persisted
      end

      it "redirects to the created partial" do
        post :create, {:partial => valid_attributes}, valid_session
        response.should redirect_to(Partial.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved partial as @partial" do
        # Trigger the behavior that occurs when invalid params are submitted
        Partial.any_instance.stub(:save).and_return(false)
        post :create, {:partial => { "f_customer_id" => "invalid value" }}, valid_session
        assigns(:partial).should be_a_new(Partial)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Partial.any_instance.stub(:save).and_return(false)
        post :create, {:partial => { "f_customer_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested partial" do
        partial = Partial.create! valid_attributes
        # Assuming there are no other partials in the database, this
        # specifies that the Partial created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Partial.any_instance.should_receive(:update).with({ "f_customer_id" => "1" })
        put :update, {:id => partial.to_param, :partial => { "f_customer_id" => "1" }}, valid_session
      end

      it "assigns the requested partial as @partial" do
        partial = Partial.create! valid_attributes
        put :update, {:id => partial.to_param, :partial => valid_attributes}, valid_session
        assigns(:partial).should eq(partial)
      end

      it "redirects to the partial" do
        partial = Partial.create! valid_attributes
        put :update, {:id => partial.to_param, :partial => valid_attributes}, valid_session
        response.should redirect_to(partial)
      end
    end

    describe "with invalid params" do
      it "assigns the partial as @partial" do
        partial = Partial.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Partial.any_instance.stub(:save).and_return(false)
        put :update, {:id => partial.to_param, :partial => { "f_customer_id" => "invalid value" }}, valid_session
        assigns(:partial).should eq(partial)
      end

      it "re-renders the 'edit' template" do
        partial = Partial.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Partial.any_instance.stub(:save).and_return(false)
        put :update, {:id => partial.to_param, :partial => { "f_customer_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested partial" do
      partial = Partial.create! valid_attributes
      expect {
        delete :destroy, {:id => partial.to_param}, valid_session
      }.to change(Partial, :count).by(-1)
    end

    it "redirects to the partials list" do
      partial = Partial.create! valid_attributes
      delete :destroy, {:id => partial.to_param}, valid_session
      response.should redirect_to(partials_url)
    end
  end

end
