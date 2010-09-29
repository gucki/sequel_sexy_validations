module Sequel
  module Plugins
    module SexyValidations

      def self.apply(model, opts={}, &block)
        model.send(:include, ::SexyValidations)
      end

      def self.configure(model, opts={}, &block)
      end

      module ClassMethods
        def validates(attribute = nil, validations = nil, &block)
          if validations
            if validations[:if]
              validations[:if] = [validations[:if]] unless validations[:if].is_a?(Array)
              implement_special_validation_conditions!(validations[:if])
            end

            if validations[:unless]
              validations[:unless] = [validations[:unless]] unless validations[:unless].is_a?(Array)
              implement_special_validation_conditions!(validations[:unless])
            end
          end

          super(attribute, validations, &block)
        end
        
        def load_validator(name)
          begin
            require "sequel_sexy_validations/validators/#{name}"
            "Sequel::Plugins::SexyValidations::Validators::#{name.to_s.capitalize}".constantize
          rescue LoadError
            super
          end
        end
        
        private
        
        def implement_special_validation_conditions!(validations)
          validations.each_with_index do |validation, i|
            case validation
              when :new
                validations[i] = lambda do |record, attribute| 
                  record.new?
                end
              when :changed
                validations[i] = lambda do |record, attribute| 
                  record.changed_columns.include?(attribute)
                end
            end
          end
        end
      end

      module InstanceMethods
        def validate
          validate!
          super
        end
      end

      module DatasetMethods
      end
    end
  end
end

