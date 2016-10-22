class Post < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
	validates :clickbait, acceptance: true

	private

	def clickbait
		if title == nil
			return false
		else
			if title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top [number]") || title.include?("Guess")
			else
				return false
			end
		end
	end

end
