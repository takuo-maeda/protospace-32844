class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @prototypes = Prototype.all
    # binding.pry
  end

  def new
    @prototype = Prototype.new
    # オブジェクトA ... (1)
  end

  def create
    @prototype = Prototype.new(prototype_params)
     # オブジェクトB ... (2)
     # (1)の@hogeとは別の新規のオブジェクト
       if @prototype.save
          redirect_to root_path, notice: "作成しました"
       else
        @prototype = Prototype.new(prototype_params)
        render 'new'
        # オブジェクトB
      
        # オブジェクトC
        # .newにより新規に作られたオブジェクトが@prototypeに設定される
        # バリデーションエラーはオブジェクトBが持っているが、
        # @hogeが指すのは、オブジェクトCになってしまったので
        # エラーは表示されない
       end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.destroy
      redirect_to root_path
    end
  end
  
  def edit
    unless user_signed_in?
      redirect_to action: :index
    else
      @prototype = Prototype.find(params[:id])
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
    else
      # @prototype = prototype.update(prototype_params)
      render :edit
    end
  end
#---------------------------------------
  # if @item.update(item_params)
  #   redirect_to @item
  # else
  #   render :edit
  # end
#---------------------------------------
#テキスト ChatAppUser管理機能問８
# def update
#   if current_user.update(user_params)
#     redirect_to root_path
#   else
#     render :edit
#   end
# end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new #from withを使用してコメントをクリエイト「comments#create」を実行したい
    @comments = @prototype.comments.includes(:user)
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image ).merge(user_id: current_user.id)
  end
end
