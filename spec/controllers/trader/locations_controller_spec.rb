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

describe Trader::LocationsController do

  # This should return the minimal set of attributes required to create a valid
  # Trader::Location. As you add validations to Trader::Location, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {  }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Trader::LocationsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all trader_locations as @trader_locations" do
      location = Trader::Location.create! valid_attributes
      get :index, {}, valid_session
      assigns(:trader_locations).should eq([location])
    end
  end

  describe "GET show" do
    it "assigns the requested trader_location as @trader_location" do
      location = Trader::Location.create! valid_attributes
      get :show, {:id => location.to_param}, valid_session
      assigns(:trader_location).should eq(location)
    end
  end

  describe "GET new" do
    it "assigns a new trader_location as @trader_location" do
      get :new, {}, valid_session
      assigns(:trader_location).should be_a_new(Trader::Location)
    end
  end

  describe "GET edit" do
    it "assigns the requested trader_location as @trader_location" do
      location = Trader::Location.create! valid_attributes
      get :edit, {:id => location.to_param}, valid_session
      assigns(:trader_location).should eq(location)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Trader::Location" do
        expect {
          post :create, {:trader_location => valid_attributes}, valid_session
        }.to change(Trader::Location, :count).by(1)
      end

      it "assigns a newly created trader_location as @trader_location" do
        post :create, {:trader_location => valid_attributes}, valid_session
        assigns(:trader_location).should be_a(Trader::Location)
        assigns(:trader_location).should be_persisted
      end

      it "redirects to the created trader_location" do
        post :create, {:trader_location => valid_attributes}, valid_session
        response.should redirect_to(Trader::Location.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved trader_location as @trader_location" do
        # Trigger the behavior that occurs when invalid params are submitted
        Trader::Location.any_instance.stub(:save).and_return(false)
        post :create, {:trader_location => {  }}, valid_session
        assigns(:trader_location).should be_a_new(Trader::Location)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Trader::Location.any_instance.stub(:save).and_return(false)
        post :create, {:trader_location => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested trader_location" do
        location = Trader::Location.create! valid_attributes
        # Assuming there are no other trader_locations in the database, this
        # specifies that the Trader::Location created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Trader::Location.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => location.to_param, :trader_location => { "these" => "params" }}, valid_session
      end

      it "assigns the requested trader_location as @trader_location" do
        location = Trader::Location.create! valid_attributes
        put :update, {:id => location.to_param, :trader_location => valid_attributes}, valid_session
        assigns(:trader_location).should eq(location)
      end

      it "redirects to the trader_location" do
        location = Trader::Location.create! valid_attributes
        put :update, {:id => location.to_param, :trader_location => valid_attributes}, valid_session
        response.should redirect_to(location)
      end
    end

    describe "with invalid params" do
      it "assigns the trader_location as @trader_location" do
        location = Trader::Location.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Trader::Location.any_instance.stub(:save).and_return(false)
        put :update, {:id => location.to_param, :trader_location => {  }}, valid_session
        assigns(:trader_location).should eq(location)
      end

      it "re-renders the 'edit' template" do
        location = Trader::Location.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Trader::Location.any_instance.stub(:save).and_return(false)
        put :update, {:id => location.to_param, :trader_location => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested trader_location" do
      location = Trader::Location.create! valid_attributes
      expect {
        delete :destroy, {:id => location.to_param}, valid_session
      }.to change(Trader::Location, :count).by(-1)
    end

    it "redirects to the trader_locations list" do
      location = Trader::Location.create! valid_attributes
      delete :destroy, {:id => location.to_param}, valid_session
      response.should redirect_to(trader_locations_url)
    end
  end

end