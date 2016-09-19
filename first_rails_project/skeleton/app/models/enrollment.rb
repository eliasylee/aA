class Enrollment < ActiveRecord::Base

  belongs_to :course,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Course

  belongs_to :student,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :User

  has_one :instructor,
    through: :course,
    source: :instructor

end
