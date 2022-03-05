# frozen_string_literal: true
mydir = __dir__

require 'i18n'
require_relative "forger/version"

I18n.load_path += Dir[File.join(mydir, 'locales', '**/*.yml')]
I18n.reload! if I18n.backend.initialized?


module Forger
  module Config
    @locale = nil
    class << self
      attr_writer :locale
      def locale
        @locale || (I18n.available_locales.include?(I18n.locale) ? I18n.locale : I18n.available_locales.first)
      end
    end
  end
  
  class Base
    class << self
      def parse(key)
      end

      def translate(*args, **opts)
        # opts[:locale] ||= :en # TODO:動的にlocaleを設定する
        opts[:locale] ||=Forger::Config.locale
        opts[:raise] = true
        I18n.translate(*args, **opts)
      rescue I18n::MissingTranslationData
        opts[:locale] = :en

        # Super-simple fallback -- fallback to en if the
        # translation was missing.  If the translation isn't
        # in en either, then it will raise again.
        disable_enforce_available_locales do
          I18n.translate(*args, **opts)
        end
      end
    end
    class Error < StandardError; end
    # Your code goes here...
  end
end
