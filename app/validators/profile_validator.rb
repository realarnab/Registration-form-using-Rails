class ProfileValidator < ActiveModel::Validator
  def validate(record)
    validate_name(record)
    validate_age(record)
    validate_gender(record)
    validate_mobile(record)
  end

  private

  def validate_name(record)
    if record.name.blank?
      record.errors.add(:name, "can't be blank")
    elsif record.name.length > 50
      record.errors.add(:name, "is too long (maximum is 50 characters)")
    end
  end

  def validate_age(record)
    if record.age.blank?
      record.errors.add(:age, "can't be blank")
    elsif record.age.to_i < 0
      record.errors.add(:age, "must be greater than or equal to 0")
    elsif record.age.to_i != record.age
      record.errors.add(:age, "must be an integer")
    end
  end

  # def validate_gender(record)
  #   unless %w[Male Female Other].include?(record.gender) || record.gender.blank?
  #     record.errors.add(:gender, "must be Male, Female, or Other")
  #   end
  # end
  def validate_gender(record)
    allowed_genders = %w[Male Female Other]
    if record.gender.blank?
      record.errors.add(:gender, "can't be blank")
    elsif !allowed_genders.include?(record.gender)
      record.errors.add(:gender, "#{record.gender} is not a valid gender")
    end
  end

  def validate_mobile(record)
    if record.mobile.blank?
      record.errors.add(:mobile, "can't be blank")
    elsif record.mobile !~ /\A[0-9]{10}\z/
      record.errors.add(:mobile, "must be a 10-digit number")
    end
  end
end
