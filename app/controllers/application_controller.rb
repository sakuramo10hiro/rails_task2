class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  def after_sign_in_path_for(resource)
      root_url 
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_url
  end


  def set_search
    if params[:area].blank? && params[:keyword].blank?
     @room = Room.all
     @cnt = Room.all.count
    elsif params[:area] 
     @room = Room.where("room_address LIKE?",'%'+params[:area]+'%')
     @cnt = Room.where("room_address LIKE?",'%'+params[:area]+'%').count
    elsif  params[:keyword] 
     @room = Room.where("room_name LIKE?",'%'+params[:keyword]+'%').or(Room.where("room_address LIKE?",'%'+params[:keyword]+'%')).or(Room.where("room_introduction LIKE?",'%'+params[:keyword]+'%')).or(Room.where("room_price LIKE?",'%'+params[:keyword]+'%')) 
     @cnt = Room.where("room_name LIKE?",'%'+params[:keyword]+'%').or(Room.where("room_address LIKE?",'%'+params[:keyword]+'%')).or(Room.where("room_introduction LIKE?",'%'+params[:keyword]+'%')).or(Room.where("room_price LIKE?",'%'+params[:keyword]+'%')).count
    else
    end
  end

  protected
  def configure_permitted_parameters
    added_attrs = [ :name, :email, :password, :password_confirmation, :user_introduction, :user_image]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs        
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs 
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs        
  end
end
