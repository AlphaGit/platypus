class Admin::SettingsController < Admin::BaseController
  def show
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
    redirect_to settings_path
  end
end
