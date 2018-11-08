class OrderMailerPreview < ActionMailer::Preview
  def order_receipt_preview
    ExampleMailer.order_receipt(User.first)
  end
end