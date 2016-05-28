class HomeController < ApplicationController
  def index
  end

  def uppost_view
  end

  def detail
  end

  def contact
  end
  
  def upload
		file = params[:picture]
		uploader = SomeUploader.new
		uploader.store!(file)
		redirect_to :back
	end

	def rank
	end
	
end
