class UserSkill < ApplicationRecord
  def user
    return User.find_by(id: self.user_id)
  end
  def skill
    return Skill.find_by(id: self.skill_id)
  end
end
