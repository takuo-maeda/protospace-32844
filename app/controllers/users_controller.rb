class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # binding.pry
    # @prototypes = @user.prototypes
    # @prototypes = Prototype.where(user_id: params[:id])
    @prototypes = Prototype.where(user_id: @user.id)
  end
end
