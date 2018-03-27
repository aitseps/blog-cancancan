class CommentsController < ApplicationController
	load_and_authorize_resource
	def create
		@post = Post.find(params[:post_id])
		@comment.user = current_user
		@post.comments << @comment
		@comment.save
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
	end

	def edit
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		@comment.update(content: params[:comment][:content])
	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end
end
