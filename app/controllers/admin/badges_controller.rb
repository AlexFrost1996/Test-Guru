class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[edit update destroy]
  before_action :set_images, only: %i[new create edit update]
  before_action :set_rules, only: %i[new create edit update]
  
  def index
    @badges = Badge.all
  end
  
  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to badge_url(@badge), notice: t('.success')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      redirect_to badge_url(@badge), notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to badges_path, notice: t('.success')
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :image_name, :rule, :rule_value)
  end

  def set_images
    @images = Dir.glob("./app/assets/images/**/*").select { |e| File.file? e }
    @images.map! { |image| image.split('/').last }
  end

  def set_rules
    @rules = Badge::RULES
  end
end
