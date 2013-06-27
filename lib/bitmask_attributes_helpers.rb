module BitmaskAttributesHelpers
  extend ActiveSupport::Concern

  module ClassMethods
    # Helps set up presence + scopes for bitmasked attributes

    # Setup presence checking methods for Bitmask attributes
    #
    # Presence attributes are setup as the possible values suffixed by a
    # question mark, and return true or false
    # @arg [Symbol] bitmask the name of the bitmask attribute
    def bitmask_presence_methods(bitmask)
      send("values_for_#{bitmask}").each do |value|
        define_method "#{value}?" do
          send("#{bitmask}?", value)
        end
      end
    end

    # Setup scopes for Bitmask attributes
    #
    # Scopes are setup with the same name as the value, and include both
    # .value and .not_value versions
    # @arg [Symbol] bitmask the name of the bitmask attribute
    def bitmask_scopes(bitmask)
      send("values_for_#{bitmask}").each do |value|
        scope value, send("with_#{bitmask}", value)
        scope "not_#{value}", send("without_#{bitmask}", value)
      end
    end

    # Setup virtual attributes for Bitmask attributes
    #
    # Allows you to set and read Bitmask attributes using #value= and
    # #value methods
    # @arg [Symbol] bitmask the name of the bitmask attribute
    def bitmask_virtual_attributes(bitmask)
      send("values_for_#{bitmask}").each do |value|
        define_method("#{value}") { send("#{bitmask}?", value) }
        define_method("#{value}=") { |arg| send("#{bitmask}=", arg.blank? || arg == "0" ? send("#{bitmask}") - [value] : send("#{bitmask}") << value) }
      end
    end

    ##
    # Set up all bitmask helpers: Virtual Attributes, scopes, and presence
    # checkers
    #
    # @arg [Symbol] bitmask the name of the bitmask attribute
    def bitmask_helpers(bitmask)
      bitmask_presence_methods(bitmask)
      bitmask_scopes(bitmask)
      bitmask_virtual_attributes(bitmask)
    end
  end
end

ActiveRecord::Base.send :include, BitmaskAttributesHelpers
