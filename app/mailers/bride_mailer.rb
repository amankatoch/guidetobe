class BrideMailer < ActionMailer::Base
  default from: "donotreply@guidetobe.co.uk"

  def welcome(bride)
    @bride = bride
    mail(to: @bride.email, subject: 'Welcome to Guide To Be')
  end

  def welcome_follow_up(bride)
    @bride = bride
    mail(to: @bride.email, subject: 'Brides-to-be need your reviews')
  end

  def review_reply(bride, review)
    @bride = bride
    @review = review
    mail(to: @bride.email, subject: 'A new response was just posted for your review')
  end

  def password_reset(bride)
    @bride = bride
    mail to: bride.email, subject: 'Password reset'
  end

  def new_review(bride)
    @bride = bride
    mail to: @bride.email, subject: 'Thanks for your review on Guide To Be'
  end

  def first_review(bride)
    @bride = bride
    mail(to: @bride.email, subject: 'Brides-to-be need your reviews')
  end

end
