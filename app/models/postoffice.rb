class Postoffice < ActionMailer::Base
  # located in models/postoffice.rb
  # make note of the headers, content type, and time sent
  # these help prevent your email from being flagged as spam

  def registered(name, email)
    @recipients   = email
    @from         = "ISFiT 2011 <noreplay@isfit.org>"
    @subject      = "Application registered"
    @sent_on      = Time.now
    @content_type = "text/plain"

    body[:name]  = name
    body[:email] = email       
  end

  def fund(application, files, mails)
    # @recipients   = "leader.stiftelsen@isfit.org"
    @recipients   = mails
    @from         = "ISFiT 2009 <noreply@isfit.org>"
    @subject      = "New application for ISFiT funds"
    @sent_on      = Time.now
    @content_type = "text/html"


    body[:name]                   = application.name
    body[:initiator]              = application.initiator
    body[:email]                  = application.email
    body[:address]                = application.address
    body[:country]                = application.country
    body[:phone]                  = application.phone
    body[:isfit_connection]       = application.isfit_connection
    body[:isfit_connection_year]  = application.isfit_connection_year
    body[:amount]                 = application.amount
    body[:account_details]        = application.account_details
    body[:purpose_text]           = application.purpose_text
    body[:plans_text]             = application.plans_text
    body[:further_funding_plan]   = application.further_funding_plan
    body[:other_info]             = application.other_info


    # attach files
    files.each do |file|
      attachment "application/octet-stream" do |a|
        a.filename = file.original_filename
        a.body = file.read
      end unless file.blank?
    end
  end
end

