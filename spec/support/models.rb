ActiveRecord::Schema.define do
  create_table :crayons do |t|
    t.integer :colors
    t.string :type # STI
  end
end

# Pseudo models for testing purposes

class Crayon < ActiveRecord::Base
  bitmask :colors, as: [:raw_umber, :pet_shop, :super_green, :periwinkle, :fuzzy_wuzzy_brown]
end

class CrayonWithPresenceMethods < Crayon
  bitmask_presence_methods :colors
end

class CrayonWithScopes < Crayon
  bitmask_scopes :colors
end

class CrayonWithVirtualAttributes < Crayon
  bitmask_virtual_attributes :colors
end

class CrayonWithHelpers < Crayon
  bitmask_helpers :colors
end
