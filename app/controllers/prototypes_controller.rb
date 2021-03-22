class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Room.room.new(prototype_params)
       if @prototype.save?
          redirect_to render_to root_path
       else
        render :new
       end
  end

  private

  def prototype_params
    params.reqire(:prototype).permit(:name, :image).merge(user_id: current_user.id)
  end
end
