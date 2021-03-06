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

describe Trader::GroupsController do

  # This should return the minimal set of attributes required to create a valid
  # Trader::Group. As you add validations to Trader::Group, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {  }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Trader::GroupsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all trader_groups as @trader_groups" do
      group = Trader::Group.create! valid_attributes
      get :index, {}, valid_session
      assigns(:trader_groups).should eq([group])
    end
  end

  describe "GET show" do
    it "assigns the requested trader_group as @trader_group" do
      group = Trader::Group.create! valid_attributes
      get :show, {:id => group.to_param}, valid_session
      assigns(:trader_group).should eq(group)
    end
  end

  describe "GET new" do
    it "assigns a new trader_group as @trader_group" do
      get :new, {}, valid_session
      assigns(:trader_group).should be_a_new(Trader::Group)
    end
  end

  describe "GET edit" do
    it "assigns the requested trader_group as @trader_group" do
      group = Trader::Group.create! valid_attributes
      get :edit, {:id => group.to_param}, valid_session
      assigns(:trader_group).should eq(group)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Trader::Group" do
        expect {
          post :create, {:trader_group => valid_attributes}, valid_session
        }.to change(Trader::Group, :count).by(1)
      end

      it "assigns a newly created trader_group as @trader_group" do
        post :create, {:trader_group => valid_attributes}, valid_session
        assigns(:trader_group).should be_a(Trader::Group)
        assigns(:trader_group).should be_persisted
      end

      it "redirects to the created trader_group" do
        post :create, {:trader_group => valid_attributes}, valid_session
        response.should redirect_to(Trader::Group.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved trader_group as @trader_group" do
        # Trigger the behavior that occurs when invalid params are submitted
        Trader::Group.any_instance.stub(:save).and_return(false)
        post :create, {:trader_group => {  }}, valid_session
        assigns(:trader_group).should be_a_new(Trader::Group)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Trader::Group.any_instance.stub(:save).and_return(false)
        post :create, {:trader_group => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested trader_group" do
        group = Trader::Group.create! valid_attributes
        # Assuming there are no other trader_groups in the database, this
        # specifies that the Trader::Group created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Trader::Group.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => group.to_param, :trader_group => { "these" => "params" }}, valid_session
      end

      it "assigns the requested trader_group as @trader_group" do
        group = Trader::Group.create! valid_attributes
        put :update, {:id => group.to_param, :trader_group => valid_attributes}, valid_session
        assigns(:trader_group).should eq(group)
      end

      it "redirects to the trader_group" do
        group = Trader::Group.create! valid_attributes
        put :update, {:id => group.to_param, :trader_group => valid_attributes}, valid_session
        response.should redirect_to(group)
      end
    end

    describe "with invalid params" do
      it "assigns the trader_group as @trader_group" do
        group = Trader::Group.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Trader::Group.any_instance.stub(:save).and_return(false)
        put :update, {:id => group.to_param, :trader_group => {  }}, valid_session
        assigns(:trader_group).should eq(group)
      end

      it "re-renders the 'edit' template" do
        group = Trader::Group.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Trader::Group.any_instance.stub(:save).and_return(false)
        put :update, {:id => group.to_param, :trader_group => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested trader_group" do
      group = Trader::Group.create! valid_attributes
      expect {
        delete :destroy, {:id => group.to_param}, valid_session
      }.to change(Trader::Group, :count).by(-1)
    end

    it "redirects to the trader_groups list" do
      group = Trader::Group.create! valid_attributes
      delete :destroy, {:id => group.to_param}, valid_session
      response.should redirect_to(trader_groups_url)
    end
  end

end
