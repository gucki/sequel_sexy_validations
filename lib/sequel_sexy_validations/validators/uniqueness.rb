# encoding: utf-8
module Sequel
  module Plugins
    module SexyValidations
      module Validators
        class Uniqueness
          def self.validate(model, attribute, value, options)
            return unless value

            return unless model.changed_columns.include?(attribute)

            unless options.is_a?(Hash)
              options = {
                :scope => options,
              }
            end
            
            options[:message] ||= "bereits vergeben"
            
            dataset = model.class.filter(~:id => model.id, attribute => value)
            if options[:scope].is_a?(Array)
              options[:scope].each do |v|
                case v
                  when Symbol
                    dataset = dataset.filter(v => model.send(v))
                  when Proc
                    dataset = dataset.filter(v.call(model))
                  else
                    dataset = dataset.filter(v)
                end
              end
            end

            unless dataset.empty?
              model.errors.add(attribute, options[:message])
            end
          end
        end
      end
    end
  end
end

