class MixPanelTrack
  MIXPANEL_API_KEY = Rails.env.production? ? '26be3e459bbd4b2f184536d12710bb3b' : '99b473aeb6b9dfb76dc4ee7f4a4cdfa9'

  def self.event user_id, event, opt={}
    tracker.track(user_id, event, opt)
  end

  def self.set_profile user_id, opt
    tracker.people.set user_id, opt
  end

  def self.alias new_internal_id, original_anonymous_id
    tracker.alias new_internal_id, original_anonymous_id
  end

  def self.set_profile user_id, opt={}
    tracker.people.set user_id, opt
  end

  def self.append_list user_id, opt={}
    tracker.people.append(user_id, opt)
  end

  private
  def self.tracker
    Mixpanel::Tracker.new(MIXPANEL_API_KEY)
  end

end
