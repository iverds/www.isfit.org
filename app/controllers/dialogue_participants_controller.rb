class DialogueParticipantsController < ApplicationController
  session :off

  def index
  	redirect_to :action => "new"
  end

  def new
	@countries = Country.find(:all, :order=>"name")
	if request.post?

		begin
			@dialogue_participant = DialogueParticipant.new(params[:dialogue_participant])

		# Catch the exception from AR::Base
		rescue ActiveRecord::MultiparameterAssignmentErrors => ex
			# Iterarate over the exceptions and remove the invalid field components from the input
			ex.errors.each { |err| params[:dialogue_participant].delete_if { |key, value| key =~ /^#{err.attribute}/ } }
			# Recreate the Model with the bad input fields removed

			@dialogue_participant = Participant.new(params[:dialogue_participant])
		end
		@dialogue_participant.registered_time = DateTime.now
		if @dialogue_participant.valid? && verify_recaptcha(:model=>@dialogue_participant, :message=>"Recaptcha verification failed") && @dialogue_participant.save
			Postoffice.deliver_registered(@dialogue_participant.first_name + " " + @dialogue_participant.last_name, @dialogue_participant.email)
			flash[:notice] = "Your application was sent successfully. You should receive an email as a conformation at the email you provided"
                        render :action => "new"
		else
      verify_recaptcha(:model=>@dialogue_participant, :message=>"Recaptcha verification failed")

			#validate_recap(params, @dialogue_participant.errors)
			flash[:warnings] = @dialogue_participant.errors
		end
	end
  end
end
