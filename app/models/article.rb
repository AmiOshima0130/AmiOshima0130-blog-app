class Article < ApplicationRecord
    validates :title, presence: true#保存するにはtitleに文字が入ることが必須
    validates :content, presence: true
end
