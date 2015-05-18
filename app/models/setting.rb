class Setting < RailsSettings::CachedSettings
  defaults[:site_name] = "My portfolio"
  defaults[:show_site_logo] = false
  defaults[:site_logo] = nil
  defaults[:show_copyright_notice] = :copyright_on_footer
  defaults[:copyright_holder_name] = "Me"
  defaults[:show_site_name] = true
  defaults[:show_sign_in_link] = true
  defaults[:show_bio_page] = false

  @@multiple_option_settings = {
    :show_copyright_notice => [:copyright_on_footer, :copyright_below_title, :no_copyright]
  }
  @@boolean_settings = [:show_site_name, :show_site_logo, :show_sign_in_link, :show_bio_page]

  # Overwriting default behavior because get_all won't return defaults
  # See https://github.com/huacnlee/rails-settings-cached/pull/56
  def self.get_all(starting_with = nil)
    vars = thing_scoped.select("var, value")
    if starting_with
      vars = vars.where("var LIKE '#{starting_with}%'")
    end

    result = {}
    vars.each do |record|
      result[record.var] = record.value
    end

    # add defaults to list of results if the key matches the namespace
    @@defaults.each do |key, value|
      # avoid overwriting actual values with defaults
      next if key.nil? || result.has_key?(key)
      result[key] = value if starting_with.nil? || key.start_with?(starting_with)
    end

    result.with_indifferent_access
  end

  def self.multiple_option_settings
    @@multiple_option_settings
  end

  def self.boolean_settings
    @@boolean_settings
  end
end
