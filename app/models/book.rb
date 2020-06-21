class Book < ApplicationRecord
	belongs_to :user
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def self.search(method, word)
		if method == "perfect_match"
			Book.where(title: word)
		elsif method == "forward_match"
			Book.where("title LIKE ?", "#{word}%")
		elsif method == "backward_match"
			Book.where("title LIKE ?", "%#{word}")
		elsif method == "partial_match"
			Book.where("title LIKE ?", "%#{word}%")
		end
	end
end
