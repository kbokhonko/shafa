class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_categories

  protected

  def set_categories
    @categories = Category.all.order(:order)
  end

  def authenticate_admin!
    if admin_signed_in?
      super
    else
      redirect_to root_path, notice: 'Ви повинні бути адміном!'
    end
  end
end
