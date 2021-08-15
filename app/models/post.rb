# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category, optional: true
end
