class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:search]
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to @room, notice:"お部屋を登録しました。"
    else
      flash[:alert] = "必須項目に入力してください"
      render "new"
    end

  end

  def show
    @room = Room.find(params[:id])
    @user = @room.user
    @reservation = Reservation.new  
  end

  def search
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
    
  private
  def room_params
    params.require(:room).permit(:room_name, :room_introduction, :room_price, :room_address, :room_image, :user_id)
  end
end
