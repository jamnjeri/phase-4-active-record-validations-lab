class Post < ApplicationRecord
    validates :title, presence:true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :clickbait?

    # Custom Validation
    CLICKBAIT_TITLES = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]

    def clickbait?
        if CLICKBAIT_TITLES.none? { |pat| pat.match title }
          errors.add(:title, "must be clickbait")
        end
    end

end
