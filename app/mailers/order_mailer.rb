class OrderMailer < ApplicationMailer

  def order_receipt
    @user = current_user
    mail(to: @user.email, subject:'This is a test email...')
  end
end
