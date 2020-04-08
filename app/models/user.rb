class User < ApplicationRecord
  has_many :lists, dependent: :destroy #userテーブルはlistテーブルを沢山持っている。
  #また、dependentの記載で、userが消えたら紐づいたリストデータも削除されるようにしている
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
end
