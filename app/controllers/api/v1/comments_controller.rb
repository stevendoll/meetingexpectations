class API::V1::CommentsController < ApplicationController

  # token authentication see https://github.com/gonzalo-bulnes/simple_token_authentication
  acts_as_token_authentication_handler_for User #, fallback_to_devise: false
  before_filter :authenticate_user_from_token!


  # POST /api/v1/posts/dc83e60f-2b34-4d8c-8107-829be601c882/comments
  # 
  # gets the user's id from the token, and the post id from the url
  # {"comment":{"body":"I wanna say something"}}
  #
  def create

    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |format| 
        #render json: @comment, status: :created
        format.json { render action: 'show', status: :created }
      end
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end


  # DELETE /api/v1/comments/06e925f1-cfd1-4795-85c9-8a785ddbe514
  def destroy
    begin
      @comment = Comment.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to api_v1_posts_path, status: 303
      return
    end

    if @comment && @comment.user == current_user
      @comment.destroy
      head :no_content
    else
      warden.custom_failure!
      render :json => { :error => true, :message => "Error 403, you don't have permissions for this operation." }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end