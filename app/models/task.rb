# frozen_string_literal: true

class Task < ApplicationRecord
  validates_presence_of :description, :due_date
  validates_inclusion_of :done, in: [true, false]

  belongs_to :parent, class_name: 'Task', optional: true

  has_many :sub_tasks, class_name: 'Task', foreign_key: :parent_id, dependent: :destroy

  scope :only_parents, -> { where(parent_id: nil) }

  def parent?
    parent_id.nil?
  end

  def sub_task?
    !parent?
  end

  def symbol
    symbols = {
      'pending' => '»',
      'done' => '✓',
      'expired' => '✗'
    }

    symbols[status]
  end

  def css_color
    colors = {
      'pending' => 'primary',
      'done' => 'success',
      'expired' => 'danger'
    }

    colors[status]
  end

  private

  def status
    return 'done' if done?

    due_date.past? ? 'expired' : 'pending'
  end
end
