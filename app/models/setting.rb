class Setting < RailsSettings::CachedSettings
  defaults[:site_name] = "My portfolio"
  defaults[:show_site_logo] = false;

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
end
