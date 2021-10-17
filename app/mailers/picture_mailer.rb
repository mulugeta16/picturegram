class PictureMailer < ApplicationMailer
  def picture_mail(picture)
  @picture = picture
  mail to: "mulugeta2030@gmail.com", subject: "Inquiry confirmation email"
   end
end
