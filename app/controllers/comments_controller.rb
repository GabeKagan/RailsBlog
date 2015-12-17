class CommentsController < ApplicationController
  
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
    $int1 = 1 + rand(9)
    $int2 = 1 + rand(9)

  def create
    @article = Article.find(params[:article_id])
    @result = params[:answer] #Gets passed properly.
    #render :text => $int1
    if ($int1).to_i + ($int2).to_i == (@result).to_i
      @comment = @article.comments.create(comment_params)
    end
    redirect_to article_path(@article)
  end
 
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end