class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

  mail to: "samurai310@aol.jp", subject: "お問い合わせの確認メール"
  end
end
