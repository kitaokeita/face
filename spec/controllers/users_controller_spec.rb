require 'rails_helper'

describe UsersController do
  describe 'GET #show' do
      it "assigns the requested user to @user" do
        user = FactoryBot.create(:user)
        get :show,  params: {id: user}
        expect(assigns(:user)).to eq user
      end

      it "renders the :show template" do
        user = FactoryBot.create(:user)
        get :show,  params: {id: user}
        expect(response).to render_template :show
      end
    end

    describe 'POST #create' do
        it "saves the new contact in the database" do
          expect{
            post :create, params: {user: FactoryBot.attributes_for(:user)}
          }.to change(User, :count).by(1)
        end
        it "redirects to users#show" do
          post :create, params: {user: FactoryBot.attributes_for(:user)}
          #expect(response).to redirect_to user_path
        end
      end

      describe 'PATCH #update' do
          it "locates the requersted @user" do
            user = FactoryBot.create(:user)
            patch :update, params: {id: user, user: FactoryBot.attributes_for(:user)}
            expect(assigns(:user)).to eq user
          end

          it "changes @user's attributes" do
            user = FactoryBot.create(:user)
            patch :update,params: {id: user,user: FactoryBot.attributes_for(:user, name: 'name2', email: 'email2')}
            user.reload
            expect(user.name).to eq("name2")
            expect(user.email).to eq("email2")
          end

          it "redirects users_path" do
            user = FactoryBot.create(:user)
            patch :update,params: {id: user,user: FactoryBot.attributes_for(:user)}
            expect(response).to redirect_to user_path
          end
        end

        describe 'delete #destroy' do
        it "deletes the user" do
          user = FactoryBot.create(:user)
          expect{
            delete :destroy, params: {id: user}
          }.to change(User,:count).by(-1)
        end
      end
end
