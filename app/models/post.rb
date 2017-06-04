class Post < ActiveRecord::Base
    belongs_to :topic
    validates :body, :title, uniqueness: true
    has_many :comments, dependent: :destroy
end