class Article < ApplicationRecord
    validates :title, presence: true#保存するにはtitleに文字が入ることが必須
    validates :content, presence: true

    def display_created_at
        I18n.l(self.created_at, format: :default)
    end
end
