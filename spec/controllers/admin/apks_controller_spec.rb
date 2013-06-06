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

describe Admin::ApksController do

  # This should return the minimal set of attributes required to create a valid
  # Admin::Apk. As you add validations to Admin::Apk, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Admin::ApksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all admin_apks as @admin_apks" do
      apk = Admin::Apk.create! valid_attributes
      get :index, {}, valid_session
      assigns(:admin_apks).should eq([apk])
    end
  end

  describe "GET show" do
    it "assigns the requested admin_apk as @admin_apk" do
      apk = Admin::Apk.create! valid_attributes
      get :show, {:id => apk.to_param}, valid_session
      assigns(:admin_apk).should eq(apk)
    end
  end

  describe "GET new" do
    it "assigns a new admin_apk as @admin_apk" do
      get :new, {}, valid_session
      assigns(:admin_apk).should be_a_new(Admin::Apk)
    end
  end

  describe "GET edit" do
    it "assigns the requested admin_apk as @admin_apk" do
      apk = Admin::Apk.create! valid_attributes
      get :edit, {:id => apk.to_param}, valid_session
      assigns(:admin_apk).should eq(apk)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Admin::Apk" do
        expect {
          post :create, {:admin_apk => valid_attributes}, valid_session
        }.to change(Admin::Apk, :count).by(1)
      end

      it "assigns a newly created admin_apk as @admin_apk" do
        post :create, {:admin_apk => valid_attributes}, valid_session
        assigns(:admin_apk).should be_a(Admin::Apk)
        assigns(:admin_apk).should be_persisted
      end

      it "redirects to the created admin_apk" do
        post :create, {:admin_apk => valid_attributes}, valid_session
        response.should redirect_to(Admin::Apk.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved admin_apk as @admin_apk" do
        # Trigger the behavior that occurs when invalid params are submitted
        Admin::Apk.any_instance.stub(:save).and_return(false)
        post :create, {:admin_apk => { "name" => "invalid value" }}, valid_session
        assigns(:admin_apk).should be_a_new(Admin::Apk)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Admin::Apk.any_instance.stub(:save).and_return(false)
        post :create, {:admin_apk => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested admin_apk" do
        apk = Admin::Apk.create! valid_attributes
        # Assuming there are no other admin_apks in the database, this
        # specifies that the Admin::Apk created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Admin::Apk.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => apk.to_param, :admin_apk => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested admin_apk as @admin_apk" do
        apk = Admin::Apk.create! valid_attributes
        put :update, {:id => apk.to_param, :admin_apk => valid_attributes}, valid_session
        assigns(:admin_apk).should eq(apk)
      end

      it "redirects to the admin_apk" do
        apk = Admin::Apk.create! valid_attributes
        put :update, {:id => apk.to_param, :admin_apk => valid_attributes}, valid_session
        response.should redirect_to(apk)
      end
    end

    describe "with invalid params" do
      it "assigns the admin_apk as @admin_apk" do
        apk = Admin::Apk.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Admin::Apk.any_instance.stub(:save).and_return(false)
        put :update, {:id => apk.to_param, :admin_apk => { "name" => "invalid value" }}, valid_session
        assigns(:admin_apk).should eq(apk)
      end

      it "re-renders the 'edit' template" do
        apk = Admin::Apk.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Admin::Apk.any_instance.stub(:save).and_return(false)
        put :update, {:id => apk.to_param, :admin_apk => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested admin_apk" do
      apk = Admin::Apk.create! valid_attributes
      expect {
        delete :destroy, {:id => apk.to_param}, valid_session
      }.to change(Admin::Apk, :count).by(-1)
    end

    it "redirects to the admin_apks list" do
      apk = Admin::Apk.create! valid_attributes
      delete :destroy, {:id => apk.to_param}, valid_session
      response.should redirect_to(admin_apks_url)
    end
  end

end