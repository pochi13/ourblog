class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to:"自信のメールアドレス@xxx.com",subject: "confirmation"
  end
end
