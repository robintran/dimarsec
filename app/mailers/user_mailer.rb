class UserMailer < ActionMailer::Base

  def notice(from)
    mail from: from
    mail to: 'bhanurorkitchen2@gmail.com', subject: "New Newsletter Adding"
  end

  def signup_confirmation(answer1_question1,
    answer1_question2,
    answer1_question3, answer2_question3, answer3_question3,
    answer1_question4,
    answer1_question5, answer2_question5, answer3_question5,
    answer1_question6, answer2_question6, answer3_question6,
    answer1_question7,
    answer1_question8, answer2_question8,
    answer1_question9, answer2_question9,
    answer1_question10,
    answer1_question11, answer2_question11, answer3_question11,answer4_question11,answer5_question11
    )

    @answer1_question1 = answer1_question1
    @answer1_question2 = answer1_question2
    @answer1_question3 = answer1_question3
    @answer2_question3 = answer2_question3
    @answer3_question3 = answer3_question3
    @answer1_question4 = answer1_question4
    @answer1_question5 = answer1_question5
    @answer2_question5 = answer2_question5
    @answer3_question5 = answer3_question5
    @answer1_question6 = answer1_question6
    @answer2_question6 = answer2_question6
    @answer3_question6 = answer3_question6
    @answer1_question7 = answer1_question7
    @answer1_question8 = answer1_question8
    @answer2_question8 = answer2_question8
    @answer1_question9 = answer1_question9
    @answer2_question9 = answer2_question9
    @answer1_question10 = answer1_question10
    @answer1_question11 = answer1_question11
    @answer2_question11 = answer2_question11
    @answer3_question11 = answer3_question11
    @answer4_question11 = answer4_question11
    @answer5_question11 = answer5_question11

    mail from: "prasadmadala@gmail.com"
    mail to: 'bhanurorkitchen2@gmail.com', subject: "Security Survey"
  end
end
