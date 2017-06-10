class Post < ActiveRecord::Base
    belongs_to :topic
    belongs_to :user
    has_many :comments, dependent: :destroy
    
   validates :title, length: { minimum: 5 }, presence: true
   validates :body, length: { minimum: 20 }, presence: true
   validates :topic, presence: true
   validates :body, :title, uniqueness: true
   validates :user, presence: true
   
   default_scope {order('title DESC')}
   scope :ordered_by_title, -> {order('title DESC')}
   scope :ordered_by_reverse_created_at, -> {order('created_at ASC')}
end