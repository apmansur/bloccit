require 'rails_helper'

include RandomData

RSpec.describe AdvertisementsController, type: :controller do
 let(:my_user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
   let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
   let(:my_post) { my_topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: my_user) }
   

 let (:my_ad) do
   Advertisement.create(
     id: 1,
     title: RandomData.random_sentence,
     body: RandomData.random_paragraph,
     price: 99
     )
   end
   
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  

  it "assigns [my_ad] to @advertisements" do
    get :index
    expect(assigns(:advertisements)).to eq([my_ad])
  end
end

    describe "GET show" do
     it "returns http success" do
 
       get :show, {id: my_ad.id}
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do

       get :show, {id: my_ad.id}
       expect(response).to render_template :show
     end
 
     it "assigns my_ad to @advertisements" do
       get :show, {id: my_ad.id}
 
       expect(assigns(:advertisement)).to eq(my_ad)
     end
   end
   
      describe "advertisement create" do

      it "increases the number of advertisements by 1" do
        expect{post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99}}.to change(Advertisement,:count).by(1)
      end
 
 
      it "assigns the new advertisement to @advertisement" do
        post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99}
        expect(assigns(:advertisement)).to eq Advertisement.last
      end
 

      it "redirects to the new advertisement" do
        post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99}
        expect(response).to redirect_to Advertisement.last
      end
    end
    
    
       describe "GET edit" do
     it "returns http success" do
       get :edit, {id: (my_ad).id}
       expect(response).to have_http_status(:success)
   end
 
     it "renders the #edit view" do
       get :edit, {id: (my_ad).id}

       expect(response).to render_template :edit
     end
 
 
     it "assigns advertisement to be updated to @advertisement" do
       get :edit, {id: (my_ad).id}
 
       post_instance = assigns(:advertisement)
 
       expect(post_instance.id).to eq my_ad.id
       expect(post_instance.title).to eq my_ad.title
       expect(post_instance.body).to eq my_ad.body
       expect(post_instance.price).to eq my_ad.price
     end
   end

end

