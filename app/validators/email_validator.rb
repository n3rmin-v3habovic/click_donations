class EmailValidator < ActiveModel::EachValidator

  EMAIL_REGEX = /\A(?=[A-Z0-9][A-Z0-9#@._%+-]{5,253}$)[A-Z0-9#._%+-]{1,64}@(?:(?=[A-Z0-9-]{1,63}\.)[A-Z0-9]+(?:-[A-Z0-9]+)*\.){1,8}[A-Z]{2,63}\z/i

  def validate_each(record, attribute, value)
    unless value == '' || value == nil || value =~ EMAIL_REGEX
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end
