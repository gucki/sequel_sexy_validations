# encoding: utf-8
module Sequel
  module Plugins
    module SexyValidations
      module Validators
        class Uniqueness
          def self.validate(model, attribute, value, options)
            return unless value

            if model.class.dataset[attribute => value]
              model.errors.add(attribute, "bereits vergeben")
            end
          end
        end
      end
    end
  end
end

