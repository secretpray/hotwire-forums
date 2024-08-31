module SubscribeHelper
  def subscribed_reason(user, discussion)
    return "You're not receiving notifications from this thread" if user.blank?

    if subscription = discussion.subscription_for(user)
      if subscription.subscription_type == "optout"
        "You're ignoring this thread."
      elsif subscription.subscription_type == "optin"
        "You're receiving notifications because you've subscribed to this thread."
      end
    elsif discussion.posts.where(user_id: user.id).any?
      "You're receiving notifications because you've posted in this thread."
    else
      "You're not receiving notifications from this thread"
    end
  end
end
