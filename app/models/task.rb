# frozen_string_literal: true

class Task < ApplicationRecord
  validates_presence_of :description
  validates_inclusion_of :done, in: [true, false]
end
