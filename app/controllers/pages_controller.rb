class PagesController < ApplicationController
  def home
  end

  def memo
  end

  def index
  	@memos = Memo.all.order(created_at: :desc)
  end

  def show
  	@memo = Memo.find_by(id: params[:id])
  end

  def create
  	@memo = Memo.new(content: params[:content])
  	@memo.save
  	redirect_to("/index")
  end
end
