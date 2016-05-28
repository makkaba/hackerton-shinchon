class HomeController < ApplicationController
  def index
    @posts = Post.all
  end

  def uppost_view
  end

  def detail

    @post = Post.find_by(id: params[:id])
    @recent_reply = Reply.order(created_at: :desc)

  end

  def contact
  end
  
  def upload
		file = params[:post_picture]
		uploader = PostUploader.new
		uploader.store!(file)

		post = Post.new
    post.title = params[:post_title]
    post.content = params[:post_content]
    post.server_url = params[:post_url]
    post.user = current_user
    #post.user_id = current_user.id
    post.img_url = uploader.url
    post.thumb_url = uploader.thumb.url

    post.save

    redirect_to :back
    
	end

	def rank
	end
  def write_reply
    reply = Reply.new
    reply.content = params[:reply_content]
    reply.post_id = params[:post_id]
    reply.user = current_user
    reply.save
    redirect_to :back


  end
	
end
