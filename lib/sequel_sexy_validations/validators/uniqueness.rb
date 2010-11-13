# encoding: utf-8
module Sequel
  module Plugins
    module SexyValidations
      module Validators
        class Uniqueness
          def self.apply_scope_filter!(model, dataset, filter)
            case filter
              when Array
                filter.each do |filter1|
                  apply_scope_filter!(model, dataset, filter1)
                end
              when Symbol
                dataset.filter!(filter => model.send(filter))
              when Proc
                dataset.filter!(filter.call(model))
              else
                dataset.filter!(filter)
            end
          end

          def self.validate(model, attribute, value, options)
            return unless value

            unless options.is_a?(Hash)
              options = {
                :scope => options,
              }
            end
            
            options[:message] ||= "bereits vergeben"
            
            dataset = model.class.filter(~{:id => model.id}, {attribute => value})
            apply_scope_filter!(model, dataset, options[:scope])

            unless dataset.empty?
              model.errors.add(attribute, options[:message])
            end
          end
        end
      end
    end
  end
end

