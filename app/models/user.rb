class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  has_many :books, dependent: :destroy
  attachment :profile_image

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, length: { in: 2..20 }
  validates :introduction, length: {maximum: 50}

	def self.search(method, word)
		if method == "perfect_match"
			User.where(name: word)
		elsif method == "forward_match"
			User.where("name LIKE ?", "#{word}%")
		elsif method == "backward_match"
			User.where("name LIKE ?", "%#{word}")
		elsif method == "partial_match"
			User.where("name LIKE ?", "%#{word}%")
		end
	end

end
