class CommentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        comment = Comment.create!(comment_params)
        render json: comment, status: :created
    end

    def show
        comment = Comment.find(params[:id])
        render json: comment, status: :ok
    end

    def index
        render json: Comment.all, status: :ok
    end

    def updated
        comment = Comment.find(params[:id])
        comment.update!(comment_params)
        render json: comment, status: :ok
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        head :no_content
    end

    private 
     
    def comment_params
        params.permit(:comment)
     end

     def render_not_found_response
        render json: { error: "User not found" }, status: :not_found
     end

     def render_unprocessable_entity_response(e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
     end

end
