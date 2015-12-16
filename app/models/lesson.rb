class Lesson < ActiveRecord::Base
  include CreateActivity
  belongs_to :user
  belongs_to :category
  has_many :results, dependent: :destroy
  has_many :words, through: :results

  accepts_nested_attributes_for :results, allow_destroy: true

  validates :user_id, presence: true
  validates :category_id, presence: true

  before_create :get_words
  after_create :create_lesson_activity
  after_update :finish_lesson_activity

  private

  def finished?
    !count_true.nil?
  end

  def get_words
    words = category.words.order("RANDOM()").limit(10)
    words.each{|word| results.build word: word}
  end

  def create_lesson_activity
    create_activity category_id, Settings.activity_type.create, Settings.activity_type.lesson, user_id
  end

  def finish_lesson_activity
    unless finished?
      create_activity category_id, Settings.activity_type.finish, Settings.activity_type.lesson, user_id
    end
  end
end
