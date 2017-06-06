require 'rails_helper'

RSpec.describe SponseredsController, type: :controller do
   let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }

   let(:my_sponsered) { my_topic.sponsereds.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99) }
  


    describe "GET new" do
      it "returns http success" do
        get :new, topic_id: my_topic.id
        expect(response).to have_http_status(:success)
      end
 

      it "renders the #new view" do
       get :new, topic_id: my_topic.id
        expect(response).to render_template :new
      end
 

      it "instantiates @sponsered" do
        get :new, topic_id: my_topic.id
        expect(assigns(:sponsered)).not_to be_nil
      end
    end
 
    describe "sponsered create" do

      it "increases the number of Sponsered by 1" do
          expect{post :create, topic_id: my_topic.id, sponsered: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99}}.to change(Sponsered,:count).by(1)
      end
 
      it "assigns the new sponsered to @sponsered" do
        post :create, topic_id: my_topic.id, sponsered: {title: RandomData.random_sentence, body: RandomData.random_paragraph , price: 99}
        expect(assigns(:sponsered)).to eq Sponsered.last
      end
 

      it "redirects to the new sponsered" do
        post :create, topic_id: my_topic.id, sponsered: {title: RandomData.random_sentence, body: RandomData.random_paragraph , price: 99}
       expect(response).to redirect_to [my_topic, Sponsered.last]
      end
    end
    
    describe "GET show" do
     it "returns http success" do
 
       get :show, topic_id: my_topic.id, id: my_sponsered.id
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do

      get :show, topic_id: my_topic.id, id: my_sponsered.id
       expect(response).to render_template :show
     end
 
     it "assigns my_sponsered to @sponsered" do
       get :show, topic_id: my_topic.id, id: my_sponsered.id
 
       expect(assigns(:sponsered)).to eq(my_sponsered)
     end
   end
   
    describe "GET edit" do
     it "returns http success" do
        get :edit, topic_id: my_topic.id, id: my_sponsered.id
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
        get :edit, topic_id: my_topic.id, id: my_sponsered.id

       expect(response).to render_template :edit
     end
 

     it "assigns sponsered to be updated to @sponsered" do
        get :edit, topic_id: my_topic.id, id: my_sponsered.id
 
       sponsered_instance = assigns(:sponsered)
 
       expect(sponsered_instance.id).to eq my_sponsered.id
       expect(sponsered_instance.title).to eq my_sponsered.title
       expect(sponsered_instance.body).to eq my_sponsered.body
       expect(sponsered_instance.price).to eq my_sponsered.price
     end
   end
   
      describe "PUT update" do
     it "updates sponsered with expected attributes" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
       new_price = 99
 
      put :update, topic_id: my_topic.id, id: my_sponsered.id, sponsered: {title: new_title, body: new_body, price: new_price}
 

       updated_sponsered = assigns(:sponsered)
       expect(updated_sponsered.id).to eq my_sponsered.id
       expect(updated_sponsered.title).to eq new_title
       expect(updated_sponsered.body).to eq new_body
       expect(updated_sponsered.price).to eq new_price
     end
 
     it "redirects to the updated sponsered" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
 

       put :update, topic_id: my_topic.id, id: my_sponsered.id, sponsered: {title: new_title, body: new_body}
       expect(response).to redirect_to [my_topic, my_sponsered]
     end
   end
   
    describe "DELETE destroy" do
        it "deletes the sponsered" do
           delete :destroy, topic_id: my_topic.id, id: my_sponsered.id
     
           count = Sponsered.where({id: my_sponsered.id}).size
           expect(count).to eq 0
         end
 
        it "redirects to topic show" do

       delete :destroy, topic_id: my_topic.id, id: my_sponsered.id
       expect(response).to redirect_to my_topic
     end
   end
end
