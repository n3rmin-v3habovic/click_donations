module MaterialDesignFormHelper
  OUTER_DIV_CLASS = 'mdl-textfield mdl-js-textfield mdl-textfield--floating-label'.freeze
  TEXT_FIELD_CLASS = 'mdl-textfield__input'.freeze
  LABEL_FIELD_CLASS = 'mdl-textfield__label'.freeze

  def text_field_block(form_builder, attribute, input_opts = {}, label_opts = {})
    input_field_block form_builder, :text_field, attribute, input_opts, label_opts
  end

  def email_field_block(form_builder, attribute, input_opts = {}, label_opts = {})
    input_field_block form_builder, :email_field, attribute, input_opts, label_opts
  end

  def password_field_block(form_builder, attribute, input_opts = {}, label_opts = {})
    input_field_block form_builder, :password_field, attribute, input_opts, label_opts
  end

  def checkbox_field_block(form_builder, attribute, input_opts = {}, label_opts = {})
    content_tag :label, class: 'mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect', for: 'user_remember_me' do
      concat form_builder.text_field(attribute, input_opts.merge(class: 'mdl-checkbox__input', type: 'checkbox'))
      concat content_tag(:span, 'Label', class: 'mdl-checkbox__label')
    end
  end

  private

  def input_field_block(form_builder, field_type, attribute, input_opts = {}, label_opts = {})
    content_tag :div, class: OUTER_DIV_CLASS do
      concat form_builder.send(field_type, attribute, input_opts.merge(class: TEXT_FIELD_CLASS))
      concat form_builder.label(attribute, label_opts.merge(class: LABEL_FIELD_CLASS))
    end
  end
end
