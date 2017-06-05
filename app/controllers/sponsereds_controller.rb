class SponseredsController < ApplicationController
  def show
    @sponsered = Sponsered.find(params[:id])
  end

  def new
     @topic = Topic.find(params[:topic_id])
     @sponsered = Sponsered.new
  end

  def edit
      @sponsered = Sponsered.find(params[:id])
  end
  
   def create

     @sponsered = Sponsered.new
     @sponsered.title = params[:sponsered][:title]
     @sponsered.body = params[:sponsered][:body]
     @sponsered.price = params[:sponsered][:price]
     
     @topic = Topic.find(params[:topic_id])
     @sponsered.topic = @topic

     if @sponsered.save

       flash[:notice] = "Post was saved."
       redirect_to [@topic, @sponsered]
     else
 
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :new
     end
   end
   
    def update
     @sponsered = Sponsered.find(params[:id])
     @sponsered.title = params[:sponsered][:title]
     @sponsered.body = params[:sponsered][:body]
     @sponsered.price = params[:sponsered][:price]
 
     if @sponsered.save
       flash[:notice] = "Post was updated."
       redirect_to [@sponsered.topic, @sponsered]
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :edit
     end
   end
   
    def destroy
     @sponsered = Sponsered.find(params[:id])
 
 
     if @sponsered.destroy
       flash[:notice] = "\"#{@sponsered.title}\" was deleted successfully."
       redirect_to @sponsered.topic
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
   end
  
  
  
  
end
