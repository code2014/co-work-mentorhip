class Order < ActiveRecord::Base
  attr_accessible :card_expires_on, :card_type, :cart_id, :first_name, :ip_address, :last_name, :card_number, :email, :stripe_card_token, :course_id
  attr_accessor :card_number, :card_verification, :stripe_card_token
  #validate :validate_card, :on => :create
  has_many :transactions, :class_name => "OrderTransaction"
  belongs_to :course
  validates_presence_of :course_id
  validates_presence_of :email
  # def purchase
  #   response = GATEWAY.purchase(100, credit_card, purchase_options)
 	# transactions.create!(:action => "purchase", :amount => 100, :response => response)
  #   response.success?
  # end
  #  def purchase_options
  #   {
  #     :ip => ip_address,
  #     :billing_address => {
  #       :name     => [first_name, last_name].join(" "),
  #       :address1 => street,
  #       :city     => city,
  #       :state    => state,
  #       :country  => country,
  #       :zip      => zip.to_s
  #     }
  #   }
  # end
  def price_in_cents
    (course.price*100).round
  end
  # def validate_card
  #   unless credit_card.valid?
  #     credit_card.errors.full_messages.each do |message|
  #       errors[:base] << message
  #     end
  #   end
  # end
  
  # def credit_card
  #   @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
  #     :type               => card_type,
  #     :number             => card_number,
  #     :verification_value => card_verification,
  #     :month              => card_expires_on.month,
  #     :year               => card_expires_on.year,
  #     :first_name         => first_name,
  #     :last_name          => last_name
  #   )
  # end
  

  def save_with_payment
    if valid?
      charge = Stripe::Charge.create(
        :amount => price_in_cents, # amount in cents, again
        :currency => "usd",
        :card => stripe_card_token,
        :description => "payinguser@example.com"
      )
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

end

