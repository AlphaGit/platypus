class Admin::SettingsController < Admin::BaseController
  def show
    @settings = Setting.get_all
  end

  def update
    params[:settings].each_pair do |setting_key, setting_value|
      Setting.send("#{setting_key}=", setting_value)
    end
    redirect_to settings_path
  end
end
