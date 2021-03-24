class PrototypesController < ApplicationController
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
        # @prototype = Prototype.new(prototype_params)
        render  'new'# オブジェクトB
      
        # オブジェクトC
        # .newにより新規に作られたオブジェクトが@prototypeに設定される
        # バリデーションエラーはオブジェクトBが持っているが、
        # @hogeが指すのは、オブジェクトCになってしまったので
        # エラーは表示されない
       end
  end
  def show
    @prototype = Prototype.find(params[:id])
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image ).merge(user_id: current_user.id)
  end
end
