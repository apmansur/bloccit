class Post < ActiveRecord::Base
    validates :body, :title, uniqueness: true
    has_many :comments, dependent: :destroy
end