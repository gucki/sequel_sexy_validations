module Sequel
  module Plugins
    module SexyValidations

      def self.apply(model, opts={}, &block)
      end

      def self.configure(model, opts={}, &block)
      end

      module ClassMethods
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

