class Product < ActiveRecord::Base

has_many :posts, :dependent => :destroy

end
