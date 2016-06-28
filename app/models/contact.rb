class Contact < ActiveRecord::Base

    # Add validation for Contact form
    validates :name, presence: true
    validates :email, presence: true
    # validates :comments, presence: true

end