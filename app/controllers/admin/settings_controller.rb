class Admin::SettingsController < Admin::BaseController
  def show
    @boolean_settings = Setting.boolean_settings
    @settings = Setting.get_all
  end

  def update
    params[:settings].each_pair do |setting_key, setting_value|
      if [:site_logo].include? setting_key.to_sym
        next unless setting_value.present?
        extension = File.extname(setting_value.original_filename)
        # TODO improve path generation to be of a more generic usage:
        # - OS-agnostic separators
        # - Take asset path from somewhere in Rails
        private_path = "public/"
        file_path = "/settings/site_logo#{extension}"
        File.open("#{private_path}/#{file_path}", "w+b") { |f| f.write(setting_value.read) }
        Setting.site_logo = file_path
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
