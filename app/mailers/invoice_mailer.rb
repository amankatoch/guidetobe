class InvoiceMailer < ActionMailer::Base
  default from: "guidetobe@guidetobe.co.uk"

  def deliver_invoice(invoice)
    @invoice = invoice
    mail(to: @invoice.email, subject: "Guide To Be Invoice: #{@invoice.reference}")
  end
end
