class Graph < ActiveRecord::Base
  belongs_to :bibliome
  belongs_to :source, :polymorphic => true
  belongs_to :target, :polymorphic => true
end
