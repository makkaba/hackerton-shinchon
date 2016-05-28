class HomeController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def uppost_view
  end

  def detail

    @post = Post.find_by(id: params[:id])
    @recent_reply = Reply.order(created_at: :desc).limit(5)
    @like = Like.where(user_id: current_user).where(post_id: params[:id])

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

    redirect_to "/"
    
	end

	def rank
    @posts = Post.all.order(like_count: :desc)
	end
  def write_reply
    reply = Reply.new
    reply.content = params[:reply_content]
    reply.post_id = params[:post_id]
    reply.user = current_user
    reply.save
    redirect_to :back


  end
  
  def add_reply
    reply = Reply.new
    reply.content = params[:reply_content]
    reply.post_id = params[:post_id]
    reply.user = current_user
    
    respond_to do |format|
      if reply.save
        format.json {render json: {message: "댓글 작성 성공" }}
        #format.json {render nothing: true, status: 200 }
      else
      
        format.json {render json: {message: "오류가 있습니다"}}
      end


    end
  end
  
  def add_like
    
    #이미 좋아요를 했는지 체크
    result = Like.where(user_id: current_user).where(post_id: params[:post_id])


    like = Like.new
    like.user = current_user
    like.post_id = params[:post_id]
    
    respond_to do |format|
      
      
      if like.save

        post = Post.find(params[:post_id])
        post.like_count = post.like_count+1
        post.save

        format.json {render json: {message: "좋아요 완료" }}
        #format.json {render nothing: true, status: 200 }
      else
      
        format.json {render json: {message: "이미 좋아요를 했습니다"} }
      end


    end
    #


  end
	
end
