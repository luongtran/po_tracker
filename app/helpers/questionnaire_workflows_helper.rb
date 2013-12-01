module QuestionnaireWorkflowsHelper
  def answer(vendor_questionnaire, question)
    logger = Logger.new('log/questionnaire_workflow.log')
    logger.info("============== Log for helper ================")
    logger.info(vendor_questionnaire)
    logger.info(question)
    answer = nil
    if !vendor_questionnaire.approval_step.nil? && vendor_questionnaire.approval_step > 2
      answers = vendor_questionnaire.vendor_questionnaire_answers
      answers.each do |a|
        logger.info(a)
        if a.question_id == question.id
          answer = a.answer
          if answer.nil?
            answer = a.question_answer_id
          end
        end
      end
    end
    logger.info(answer)
    answer
  end
  
  def is_vendor_answer(answer, vendor_questionnaire)
    result = false
    if !vendor_questionnaire.approval_step.nil? && vendor_questionnaire.approval_step > 2
      vendor_answers = vendor_questionnaire.vendor_questionnaire_answers
      if vendor_answers
        vendor_answers.each do |a|
          if a.question_answer_id == answer
            return true
          end
        end
        
      end
      
    end
    
    result
    
  end
  
end
