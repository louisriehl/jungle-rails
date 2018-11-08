class OrderMailer < ApplicationMailer

  default from: "no-reply@jungle.com"

  def order_receipt(order)
    @order = order
    mail(to: @order.email, subject:'This is a test email...')
  end
end
