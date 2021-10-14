require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "GET #index" do
        it "renders the users index" do
            allow(subject).to receive(:logged_in?).and_return(true)
            get :index
            expect(response).to render_template(:index)
        end
    end

    describe "Get #new" do
        it "render the form to create a new user" do
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe "DELETE #destroy" do
        let!(:test_user) { create(:user) }
        before :each do 
            allow(subject).to recieve(:logged_in?).and_return(true)
            delete :destroy, params: { id: test_user.id }
        end

        it "destroy the user" do
            expect(User.exists?(test_user.id)).to be false
        end

        it "redirects to users_url" do
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(users_url)
        end
    end

    describe "POST #create" do
        let!(:valid_params) do 
            { user: {username: 'charis101', email: 'charis@aa.io', password: 'password'}}
        end

        let!(:invalid_params) do 
            { user: { username: '', email: '', password: 'aord'} }
        end

        context "with valid params" do
            it "create a new user" do
                post :create, params: valid_params
                expect(User.last.username).to eq('charis101')
            end

            it "redirects to the user's show page" do
                post :create, params: valid_params
                expect(response).to redirect_to(user_url(User.last.id))
            end
        end

        context "with invalid params" do
            before :each do
                post :create, params: invalid_params
            end

            it "renders the new user template" do
                expect(response).to render_template(:new)
                expect(response).to have_http_status(422)
            end

            it "adds errors to flash" do 
                expect(flash[:errors]).to be_present
            end
        end

    end

    
        
end
