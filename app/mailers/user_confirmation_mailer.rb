class UserConfirmationMailer < Devise::Mailer
  #==| STEP 5. Creating UserConfirmationMailer class. |=======
  # Responsible for sending letters with confirmation of the mailing address.
  helper :application # gives access to all helpers defined within `application_helper`.
  layout 'mailer'
  default template_path: 'users/mailer'

  def confirmation_instructions(record, token, opts={})

    logger.debug "#{'=' * 110 }"
    logger.debug "token: #{token.inspect}"
    logger.debug "#{'=' * 110 }"
    logger.debug "record: #{record.inspect}"

    @user = record
    @token = token
    @to_email = @user.email

    @send_email = SibApiV3Sdk::TransactionalEmailsApi.new # api instance
    @mail_letter = SibApiV3Sdk::SendSmtpEmail.new # SendSmtpEmail | Values to send a transactional email

    logger.debug "#{'=' * 110 }"
    logger.debug "send_email: \n#{@send_email.inspect}"
    logger.debug "#{'=' * 110 }"
    logger.debug "mail_letter: \n#{@mail_letter.inspect}"
    logger.debug "#{'=' * 110 }"

    html = render_to_string template: 'users/mailer/confirmation_instructions'
    document = Roadie::Document.new html
    document = document.transform

    logger.debug "#{'=' * 110 }"
    logger.debug "HTML mail letter: \n#{document}"
    logger.debug "#{'=' * 110 }"

    @mail_letter.sender = {
      "name": "FindWorker",
      "email": "find-worker@mail.com"
    }
    @mail_letter.to = [{ "email": @to_email }]
    @mail_letter.html_content = document
    @mail_letter.text_content = document
    @mail_letter.subject = "Confirm Email"
    @mail_letter.reply_to = {
      "email": "find-worker@mail.com",
      "name": "FindWorker"
    }

    logger.debug "Final version mail letter: \n#{@mail_letter}"
    logger.debug "#{'=' * 110 }"

    begin
      # Send a transactional email
      result = @send_email.send_transac_email(@mail_letter)


      logger.debug "Result: \n#{result}"
      logger.debug "#{'=' * 110 }"

      return result

    rescue SibApiV3Sdk::ApiError => e
      puts "Exception when calling TransactionalEmailsApi->send_transac_email: #{e}"
    end
  end
end
