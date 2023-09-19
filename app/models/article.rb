# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
    validates :title, presence: true#保存するにはtitleに文字が入ることが必須
    validates :title, length: { minimum: 2, maximum: 100 }
    validates :title, format: { with: /\A(?!\@)/ }
    
    validates :content, presence: true
    validates :content, length: { minimum: 10 }
    validates :content, uniqueness: true

    validate :validate_title_and_content_length#独自に追加するときはvalidate

    def display_created_at
        I18n.l(self.created_at, format: :default)
    end

    private
    def validate_title_and_content_length#独自のvalidationはprivateで自分で書く
        char_count = self.title.length + self.content.length #char_count => character count
        errors.add(:content, '100文字以上で!') unless char_count > 100
    end
end
