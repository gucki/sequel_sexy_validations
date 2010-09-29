# encoding: utf-8
require "sexy_validations/validators/presence"

module Sequel
  module Plugins
    module SexyValidations
      module Validators
        class Presence < ::SexyValidations::Validators::Presence
          def self.validate(model, attribute, value, options)
            real_value = case value.class.name
              when "Sequel::Plugins::Paperclip::Attachment"
                value.queued_file
              else
                value
            end
            super(model, attribute, real_value, options)
          end
        end
      end
    end
  end
end

