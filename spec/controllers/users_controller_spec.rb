require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "GET 'new'" do
    it "is successful" do
      get :new
      expect(response.status).to eq 200
    end
  end

  describe "POST 'create'" do
      #create a user
      #redirect to the homepage
      #it doesn't save render the new form again
      #signs the user in
      let(:request){post :create, user: {email: "b@example.com"}}

      it "adds a user to the DB" do
        count = User.all.count
        #post :create, user: {email: "b@example.com"}
        request
        expect(User.all.count).to eq count + 1
      end

      it "rediercts to home page" do
        #post :create, user: {email: "b@example.com"}
        request
        expect(response.status).to redirect_to root_path
      end

      it "assigns the users id to session" do
        #post :create, user: {email: "b@example.com"}
        request
        expect(session[:user_id]).to eq assigns(:user).id #assigns:user has to equal @user in the create method within the controller.

      end


    describe "mailer" do
      #count the intial
      #execute the block
      #then check the count because it should've changed by 1.
      it "delivers to the new user" do
        ActionMailer::Base.deliveries = []
        expect { request }.to change(ActionMailer::Base.deliveries, :count).by(1)

      end
    end
  end
end
