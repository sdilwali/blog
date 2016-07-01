class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :plan
  validates_presence_of :plan_id
  validates_presence_of :email
  
  attr_accessor :stripe_card_token
  
  
  def save_with_payment
    if valid?
      # customer = Stripe::Customer.create(source: stripe_card_token, email: email, plan: plan_ID)
      customer = Stripe::Customer.create(description: email, plan: plan_id, source: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end
end
