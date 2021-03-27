class ApplicationController < ActionController::Base
  #deviceはコントローラーが編集できないためapplication.controllerにデータを引き渡す
  # ストロングパラメータをかく
  before_action :configure_permitted_parameters, if: :devise_controller? 
  #戻り値がtrueであった時のみ実行deviseのへるぱーメソッドを指定してdeviseに関するコントローラーの処理であればとしてる
  # 処理名	目的
  # :sign_in	ログイン(サインイン)の処理を行うとき
  # :sign_up	新規登録(サインアップ)の処理を行うとき
  # :account_update	アカウント情報更新の処理を行うとき

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :name, :profile, :occupation, :position])
  end
  # devise_parameter_sanitizer.permit(:deviseの処理名, keys: [:許可したいキー（カラム名）]
end
