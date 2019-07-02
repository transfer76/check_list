module FormsHelper
  def form_status_text(form)
    if form.published?
      'Published'
    else
      "Draft (#{form.updated_at.strftime('%d.%m.%Y')})"
    end
  end

  def form_published_text(form)
    if form.published?
      form.published_at.strftime('%d.%m.%Y')
    else
      "Not published"
    end
  end
end
