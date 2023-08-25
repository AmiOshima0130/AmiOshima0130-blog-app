class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|#下にカラムを追加
      t.string :title#stringは短い文字列を保存するためのカラム
      t.text :content#textは長い文字列を保存するためのカラム
      t.timestamps
    end
  end
end
