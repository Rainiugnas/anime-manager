module ApplicationHelper
  def display_back?
    %w(new edit).include?(action_name) && %w(animes).include?(controller_name)
  end

  def display_create_anime?
    %w(new edit).exclude?(action_name) && %w(animes).include?(controller_name)
  end
end
