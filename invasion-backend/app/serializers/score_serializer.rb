class ScoreSerializer
  include FastJsonapi::ObjectSerializer
  attributes :value, :created_at, :user
end
