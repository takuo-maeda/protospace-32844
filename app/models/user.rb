class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #, :confirmable #←ココに追加だけ
#          deviseの初期導入時点では「confirmable」の機能は有効化されていません。
#          そのため、設定後のように末尾に「:confirmable」を追加してください。
#          [confirmable機能の有効化]
#   ↓
# [データベースへの項目追加]
# 【補足説明】それぞれの項目説明
# 今回追加した４つの項目について、どのような目的のものか少し補足します。

# カラム名	説明	入力値例
# confirmation_token	一意のランダムトークン。この値を使って認証します	KtMVn65jFxDT1qB6aY5P
# confirmed_at	ユーザーが確認リンクをクリックしたときのタイムスタンプ	2019-09-17 13:12:37
# confirmation_sent_at	confirm_tokenが生成されたときのタイムスタンプ	2019-09-17 13:06:18
# unconfirmed_email	変更後メールアドレスを認証完了まで一時的に保持。確認リンクが押された時点でemailが上書きされ、このカラムは空に（メールアドレス変更時のみ使用）	xxxxx@gmail.com
#   ↓
# [Controllerのカスタマイズ]
#   ↓
# [送信メールフォームの修正]※途中からMailerのカスタマイズへの分岐あり
#   ↓
# [confirmable機能のオプション指定]
#   ↓
# [メール送信設定]※別Qiitaに飛びます
#   ↓
# [認証メールの動作確認]

# [途中導入の注意点]※おまけ的な
  validates :name, presence: true
  has_many  :prototypes
  has_many  :comments
end
