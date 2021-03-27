class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
#   仮に、1つのツイートに対して5つのコメントがあるとします。
# もし、そのツイートが削除されたら、それに付随する5つのコメントも削除されるべきです。
# その場合、Tweetモデル（親モデル）に関連しているCommentモデル（子モデル）のdependentオプションに、:destroyを指定します。

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
  
end
