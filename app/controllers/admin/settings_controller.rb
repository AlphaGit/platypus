class Admin::SettingsController < Admin::BaseController
  def show
    @boolean_settings = Setting.boolean_settings
    @multiple_option_settings = Setting.multiple_option_settings
    @settings = Setting.get_all
  end

  def update
    params[:settings].each_pair do |setting_key, setting_value|
      next unless setting_value.present?
      if [:site_logo].include? setting_key.to_sym
        logo_asset = SiteAsset.new(:image => setting_value, :file_name => setting_value.original_filename)
        if logo_asset.save
          Setting.site_logo = logo_asset.image.url
        end
      elsif
        Setting.multiple_option_settings.include? setting_key.to_sym
        Setting.send("#{setting_key}=", setting_value.to_sym)
      else
        Setting.send("#{setting_key}=", setting_value)
      end
    end

    missing_booleans = Setting.boolean_settings - params[:settings].keys.map(&:to_sym)
    missing_booleans.each do |setting_key|
      Setting.send("#{setting_key}=", false)
    end

    redirect_to settings_path
  end
end
