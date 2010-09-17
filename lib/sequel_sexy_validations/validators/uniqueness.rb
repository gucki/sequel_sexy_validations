# encoding: utf-8
module Sequel
  module Plugins
    module SexyValidations
      module Validators
        class Uniqueness
          def self.validate(model, attribute, value, options)
            return unless value

            unless model.class.filter(~:id => model.id, attribute => value).empty?
              model.errors.add(attribute, "bereits vergeben")
            end
          end
        end
      end
    end
  end
end

