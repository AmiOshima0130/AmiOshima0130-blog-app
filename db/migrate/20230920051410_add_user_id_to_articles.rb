class AddUserIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :user#関連性を示すメソッド。[articlesテーブル]にuserを関連付ける
  end
end
