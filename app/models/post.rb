class Post < ActiveRecord::Base
    validates :title, presence: true, uniqueness: true 
    validates :content, presence: true, length: { minimum:  250 }
    validates :summary, presence: true, length: { maximum:  250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait

  def clickbait 
    if self.title && !self.title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
     errors.add(:title, "must be clickbait")
   end 
  end 
end
