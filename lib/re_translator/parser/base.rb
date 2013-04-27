module ReTranslator
  module Parser

    class Base

      attr_reader :file_path

      def initialize(file_path, locale=nil, phrases=nil)
        @file_path = file_path
        @locale = locale
        @phrases = nil
      end

      def file
        @file ||= File.read(file_path)
      end

      # Should return hash
      # override
      def read_phrases
        raise "Override me"
      end

      # Should return language, :en, :ru and etc
      # override
      def read_locale
        raise "Override me"
      end

      def phrases
        @phrases ||= read_phrases
      end

      def locale
        @locale ||= read_locale
      end

      def save
        write
      end

      def write
        raise "Override me"
      end


      class << self

        def locale(path)
          parser = new(path)
          parser.locale
        end

        def phrases(path, locale=nil)
          parser = new(path, locale)
          parser.phrases
        end

        def save(path, locale, phrases)
          parser = new(path, locale, phrases)
          parser.save
        end

      end

    end

  end
end