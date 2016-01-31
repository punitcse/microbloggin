class microblogsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @microblog = current_user.microblogs.build(microblog_params)
    if @microblog.save
      flash[:success] = "microblog created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @microblog.destroy
    redirect_to root_url
  end

  private

    def microblog_params
      params.require(:microblog).permit(:content)
    end

    def correct_user
      @microblog = current_user.microblogs.find_by(id: params[:id])
      redirect_to root_url if @microblog.nil?
    end
end
