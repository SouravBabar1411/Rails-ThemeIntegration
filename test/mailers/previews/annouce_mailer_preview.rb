# Preview all emails at http://localhost:3000/rails/mailers/annouce_mailer
class AnnouceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/annouce_mailer/annoucement_created
  def annoucement_created
    AnnouceMailer.annoucement_created
  end

end
