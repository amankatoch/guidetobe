class Reply < ActiveRecord::Base
  validates :body, presence: true

  belongs_to :review
  belongs_to :owner

  after_create :notify_reviewer

  def notify_reviewer
    bride = review.bride
    BrideMailer.review_reply(bride, self.review).deliver
  end

end
