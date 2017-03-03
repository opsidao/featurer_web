module FeaturerWeb
  module FeaturerHelper
    def formattted_matching_values(matching_values)
      return [] unless matching_values

      matching_values.map do |matching_value|
        match = Regexp.new(/^\(\?-mix:(.*)\)$/).match(matching_value)

        if match # Looks like a regular expression
          "/#{match[1]}/"
        else
          matching_value
        end
      end
    end
  end
end
