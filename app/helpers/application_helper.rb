module ApplicationHelper
  # Returns a title on a per-page basis
  def title
    base_title = "Sample APP"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
    logo = image_tag("logo.png", :alt => "Sample App", :class => "round")
  end

  def gravatar_for(user, options = { :size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => user.name,
    :class => 'gravatar',
    :gravatar => options)
  end

end
