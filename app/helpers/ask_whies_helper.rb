module AskWhiesHelper

  def already_following? id
    current_user.following.include?(id.to_s)
  end

  def dislike_why
	  if @ask_why.dislikes.include?(current_user.id.to_s)
      @ask_why.dislikes.delete current_user.id.to_s
    else
      @ask_why.dislikes.push current_user.id.to_s
      @ask_why.likes.delete current_user.id.to_s if @ask_why.likes.include?(current_user.id.to_s)
      @ask_why.super_likes.delete current_user.id.to_s if @ask_why.super_likes.include?(current_user.id.to_s)
    end
    @ask_why.save
  end

  def like_why
    if @ask_why.likes.include?(current_user.id.to_s)
      @ask_why.likes.delete current_user.id.to_s
    else
      @ask_why.likes.push current_user.id.to_s
      @ask_why.dislikes.delete current_user.id.to_s if @ask_why.dislikes.include?(current_user.id.to_s)
      @ask_why.super_likes.delete current_user.id.to_s if @ask_why.super_likes.include?(current_user.id.to_s)
    end
    @ask_why.save  	
  end

  def reshare_why
    if @ask_why.reshare.include?(current_user.id.to_s)
      @ask_why.reshare.delete current_user.id.to_s
    else
      @ask_why.reshare.push current_user.id.to_s
    end
    @ask_why.save  
  end

  def super_like_why
    if @ask_why.super_likes.include?(current_user.id.to_s)
      @ask_why.super_likes.delete current_user.id.to_s
    else
      @ask_why.super_likes.push current_user.id.to_s
      @ask_why.likes.delete current_user.id.to_s if @ask_why.likes.include?(current_user.id.to_s)
      @ask_why.dislikes.delete current_user.id.to_s if @ask_why.dislikes.include?(current_user.id.to_s)
    end
    @ask_why.save  	
  end
end