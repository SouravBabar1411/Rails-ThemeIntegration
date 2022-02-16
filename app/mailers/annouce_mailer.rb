class AnnouceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.annouce_mailer.annoucement_created.subject
  #
  def annoucement_created
    @greeting = "Hi"

    mail to: Player.all.pluck(:email)
    #mail to: Player.where(sport_id:14).pluck(:email)
  end
end
