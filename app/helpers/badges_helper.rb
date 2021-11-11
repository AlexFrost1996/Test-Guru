module BadgesHelper
  def badge_header(badge)
    badge.new_record? ? t('new_badge') : t('edit_badge', title: @badge.title)
  end
end
