class OwnerMailer < ActionMailer::Base
  default from: "guidetobe@guidetobe.co.uk"

  def new_review(review, owner)
    @review = review
    @owner = owner
    mail(to: @owner.email, subject: 'A new review was posted on Guide To Be')
  end

  def welcome(owner)
    @owner = owner
    mail(to: @owner.email, subject: 'Welcome to Guide To Be')
  end

  def upgrade_subscription_first_week(owner)
    @owner = owner
    mail(to: @owner.email, subject: 'Get more from Guide To Be')
  end

  def upgrade_subscription_second_week(owner)
    @owner = owner
    mail(to: @owner.email, subject: 'Harness the power of the review')
  end

  def password_reset(owner)
    @owner = owner
    mail to: @owner.email, subject: 'Password reset'
  end

  def supplier_added(email, name)
    @name = name
    mail to: email, subject: 'Newlyweds are ready to review your business'
  end

  def new_supplier_added(email, name)
    @name = name
    mail to: email, subject: 'Newlyweds are reviewing your business'
  end

  def new_supplier_added_first_week(email, name)
    @name = name
    mail to: email, subject: 'Brides-to-be are looking for businesses like yours'
  end

  def new_supplier_added_second_week(email, name)
    @name = name
    mail to: email, subject: 'Newlyweds are ready to review your business'
  end

  def new_review_for_supplier_without_owner(review, supplier)
    @review   = review
    @supplier = supplier
    mail(to: @supplier.email, subject: 'You have a new review!')
  end

  def new_review_for_supplier_with_owner(review, supplier)
    @review   = review
    @supplier = supplier
    mail(to: @supplier.email, subject: 'You have a new review!')
  end      

  def upgrade(owner)
    @owner = owner
    mail to: @owner.email, subject: "You've upgraded on Guide To Be!"
  end

end
