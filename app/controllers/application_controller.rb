class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #deviseのコントローラーだったら（devise_controller?というメソッドの返り値がtrueだったら）configure_permitted_parametersを呼ぶ。
  protected
  #protectedなら自分以外のインスタンスのメソッドも呼び出せる
  def configure_permitted_parameters
    added_attrs = [ :user_name, :email, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs        #新規アカウント登録
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs #アカウント情報の更新
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs        #ログイン時
  end
end
