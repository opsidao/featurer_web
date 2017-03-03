Feature = Struct.new(:name, :matching_values) do
  class << self
    def all
      Featurer.feature_list.map do |feature_details|
        Feature.new(feature_details[:name], feature_details[:matching_values])
      end
    end

    def by_name(name)
      found_feature_hash = Featurer.feature_list.find do |feature_hash|
        !name.empty? && feature_hash[:name] == name.to_sym
      end

      raise "Unknown feature: '#{name}'" unless found_feature_hash

      Feature.new(found_feature_hash[:name], found_feature_hash[:matching_values])
    end

    def update(name, matching_values_string)
      massaged_values = matching_values_string.split("\r\n").map do |matching_value|
        regexp_match = Regexp.new(%r{^\/(.*)\/$}).match(matching_value)

        if regexp_match
          Regexp.new(regexp_match[1])
        else
          matching_value
        end
      end

      Featurer.register(name, massaged_values)
    end
  end
end
