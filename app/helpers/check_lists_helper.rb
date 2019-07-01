module CheckListsHelper
  def percents_of_answers(check_list)
    answers = check_list.answers.pluck(:response)

    total_count = answers.count.to_f
    if total_count == 0
      return {
        absent: 0,
        yes: 0,
        no: 0,
        na: 0,
      }
    end

    {
      absent: (answers.count('absent') / total_count * 100).round,
      yes: (answers.count('yes') / total_count * 100).round,
      no: (answers.count('no') / total_count * 100).round,
      na: (answers.count('na') / total_count * 100).round,
    }
  end

  def check_list_status_text(check_list)
    if check_list.published?
      'Published'
    else
      "Draft (#{check_list.updated_at.strftime('%d.%m.%Y')})"
    end
  end

  def check_list_published_text(check_list)
    if check_list.published?
      check_list.published_at.strftime('%d.%m.%Y')
    else
      "Not published"
    end
  end
end
