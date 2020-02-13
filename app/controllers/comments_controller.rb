class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create, :edit]

	def create
		@comment = Comment.new('content' => params[:content], 'user_id' => current_user.id)
		@comment.gossip_id = params[:gossip_id]
	
  	@comment.save

  	if @comment.save
    	redirect_to gossips_path
    else 
    	render 'gossip'
    end
  end

  def edit
  	@comment = Comment.find(params[:gossip_id])
  end

  def update
    @comment = Comment.find(params[:gossip_id])

    if @comment.update('content' => params[:content])
      redirect_to gossip_path
    else
      render :edit
    end
  end

  def destroy
  	@comment = Comment.find(params[:gossip_id])
    # gossip_id = Comment.find(params[:id]).gossip_id #before it is destroyed
    # Comment.destroy(params[:id])
    @comment.destroy
    redirect_to gossip_path #retrieve the gossips associated to the destroyed comment
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
  


end



