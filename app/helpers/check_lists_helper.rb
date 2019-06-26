module CheckListsHelper
  def percents_of_answers(check_list)
    answers = check_list.answers.pluck(:response)

    total_count = answers.count.to_f
    {
      absent: (answers.count('absent') / total_count * 100).round,
      yes: (answers.count('yes') / total_count * 100).round,
      no: (answers.count('no') / total_count * 100).round,
      na: (answers.count('na') / total_count * 100).round,
    }
  end
end
