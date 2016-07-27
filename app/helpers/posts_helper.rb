module PostsHelper

  def like_post
    if @post.likes.include?(current_user.id.to_s)
      @post.likes.delete current_user.id.to_s
    else
      @post.likes.push current_user.id.to_s
    end
    @post.save
  end
end