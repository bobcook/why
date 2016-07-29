module DashboardHelper
	def homepage
	@body_class = 'with-top-navbar'
  	@ask_why = AskWhy.new
  	@ask_whies = AskWhy.all.order(created_at: :desc)
  	@post = Post.new
  	@users = User.where.not(id: current_user.id)
	end
end