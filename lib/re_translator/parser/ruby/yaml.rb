module ReTranslator
  module Parser
    module Ruby

      require 'yaml'
      class Yaml < Base

        def yaml
          @yaml ||= YAML.load(file)
        end

        def read_phrases
          yaml.values.first
        end

        def read_locale
          yaml.keys.first
        end

      end

    end

  end

end
