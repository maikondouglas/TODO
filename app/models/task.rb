# frozen_string_literal: true

class Task < ApplicationRecord
  validates_presence_of :description, :due_date
  validates_inclusion_of :done, in: [true, false]

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
