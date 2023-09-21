class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|#下にカラムを追加
      t.references :user, null: false#絶対にuser-idが入っていないとダメ
      t.string :title, null: false#stringは短い文字列を保存するためのカラム
      t.text :content, null: false#textは長い文字列を保存するためのカラム
      t.timestamps
    end
  end
end
