class Bookmark < ApplicationRecord
    validates :title, :url, :interest, presence: true #タイトル、URL、面白さが空でないか？
    validates :url, format: /\A#{URI::regexp(%w(http https))}\z/ #urlか？
    validates :title, uniqueness: true, length: {maximum: 50} #タイトルはユニークか？文字数は50以下か？
end
