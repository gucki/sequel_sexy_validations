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
            case validations[:if]
              when :new
                validations[:if] = lambda { |record| record.new? }
            end

            case validations[:unless]
              when :new
                validations[:unless] = lambda { |record| record.new? }
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

