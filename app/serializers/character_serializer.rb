class CharacterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :height, :weight
end
