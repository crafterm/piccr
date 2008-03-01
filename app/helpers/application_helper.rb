# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def image_dimensions(image)
    "#{image.width} x #{image.height} pixels"
  end

end
