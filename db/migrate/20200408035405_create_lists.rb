class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t| #listsと言う名前のテーブルを作る #idカラムは自動で作成
      
      t.string :title, null: false #titleと言うカラムをstring型で作成。空だと保存不可
      t.references :user, foreign_key: true, null: false #外部キーカラムの追加。カラム名_idで設定される

      t.timestamps #カラムの保存時間、更新時間を自動で記録してくれる
    end
  end
end
