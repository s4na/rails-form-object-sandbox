# frozen_string_literal: true

class PostForm
  include ActiveModel::Model

  attr_accessor :title, :content

  validates :title, presence: true

  def initialize(post = Post.new, **attributes)
    @post = post
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    return if invalid?

    ActiveRecord::Base.transaction do
      post.update!(title: title, content: content)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  def to_model
    post
  end

  private

  attr_reader :post

  def default_attributes
    {
      title: post.title,
      content: post.content
    }
  end
end
