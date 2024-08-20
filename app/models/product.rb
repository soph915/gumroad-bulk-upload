class Product < ApplicationRecord
    validates :name, presence: true
    # validates :url_id, uniqueness: true
end
