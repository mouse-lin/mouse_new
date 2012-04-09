# -*- encoding : utf-8 -*-
class HomesController < ApplicationController
  protect_from_forgery :except => :create_comment

  def mouse
    #@blog = Blog.first
  end

  def index
    @comment = Comment.paginate(:order => "id desc", :page => params[:page],:per_page => 15)      
    @page_pre = params[:page].to_i - 1 <= 0? 1 : params[:page].to_i - 1
    @page_next = params[:page].to_i + 1 <= 1? 2 : params[:page].to_i + 1
  end

  def destroy_comment
    Comment.find(params[:id]).delete
    flash[:info] = "删除成功"
    redirect_to "/homes"
  end

  def create_comment
    params[:comment][:author] = current_user.email
    Comment.create!(params[:comment])
    redirect_to "/homes"
  rescue ActiveRecord::RecordInvalid => e
    flash[:info] = e.message
    redirect_to "/homes" 
  end

  
  def wando2
  end
end
