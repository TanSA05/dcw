class ActionsController < ApplicationController
  include ActionsHelper

	before_action :authenticate_user!
  before_action :set_complaint

  before_action :set_action, only: [:new, :create]
  before_action :permitted_action?, only: [:new, :create]
  before_action :set_forward, only: [:new,:create, :index]
  before_action :only_dcw, only: [:recieve, :recieved]

  def recieve
    unless @complaint.may_recieve?
      redirect_to root_path, error: "Already recieved"
    end
  end

  def recieved
    if @complaint.may_recieve?
      respond_to do |format|
        if @complaint.update(complaint_recieve_params)
          #push to timeline
          @complaint.recieve!
          if @complaint.organization.category == :dcw
            @complaint.internal_hearing!
            @complaint.final_target_date = Time.now + 90.days
            @complaint.save!
            #push to timeline
          else
            Forward.create(complaint: @complaint,organization: @complaint.organization)
            @complaint.forward!
            @complaint.final_target_date = Time.now + @complaint.organization.days_for_final_response.days
            @complaint.save!
            #push to timeline
            #add police details
          end
          format.html { redirect_to @complaint, notice: 'Complaint was successfully recieved.' }
        else
          format.html { render :recieve }
        end
      end
    else
    	redirect_to root_path, error: "Cannot recieve"
    end
  end

  def create
    data = action_params[:action_data]
    puts data
    if @action[:target_model] == "Complaint"
      case @action[:name]
      when :close
        if @complaint.may_close? and (is_dcw? or @complaint.organization == current_org)
          @complaint.final_remarks = data
          @complaint.close
          @complaint.save!
        else
          action_invalid
        end
      when :dispose
        if @complaint.may_dispose? and (is_dcw? or @complaint.organization == current_org)
          @complaint.final_remarks = data
          @complaint.dispose
          @complaint.save!
        else
          action_invalid
        end
      else
        action_invalid
      end
    elsif  @action[:target_model] == "Forward"
      current_org = @complaint.organization if Rails.env.development?
      case @action[:name]
      when :call_center_feedback
        if is_dcw? and not @forward.call_center_feedback.present?
          @forward.call_center_feedback = data
          @forward.save!
        else
          action_invalid
        end
      when :agency_feedback
        if @complaint.organization == current_org and not @forward.feedback_agency.present?
          @forward.feedback_agency = data
          @forward.save!
        else
          action_invalid
        end
      when :dcw_feedback
        if is_dcw? and not @forward.feedback_dcw.present?
          @forward.feedback_dcw = data
          @forward.save!
        else
          action_invalid
        end
      when :interim_remarks
        if @complaint.organization == current_org and @complaint.may_forward_keep?
          @forward.interim_remarks = data
          @forward.save!
          @complaint.forward_keep!
        else
          action_invalid
        end
      when :final_remarks
        if @complaint.organization == current_org and @complaint.may_close?
          @forward.final_remarks = data
          @forward.save!
          # @complaint.forward_final
        else
          action_invalid
        end
      when :add_reply
        if @complaint.organization == current_org and not @forward.reply_attachment.present?
          @forward.reply_attachment = data
          @forward.save!
        else
          action_invalid
        end
      else
        action_invalid
      end
    else
      action_invalid
    end
    redirect_to complaint_path @complaint
  end

  private
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    def set_action
      @action = permitted_actions[params[:action_name].to_sym]
    end

    def set_forward
      @forward = @complaint.forwards.last if @complaint.forwards
      @forward ||= nil
    end

    def permitted_action?
      unless @action
        not_found
      end
    end

    def permitted_actions
      {
        :close => { name: :close, target_field: "final_remarks", target_model: "Complaint", help_text: "Final Remarks", submit_text: "Close Complaint", type: :text },
        :dispose => { name: :dispose, target_field: "final_remarks", target_model: "Complaint", help_text: "Final Remarks", submit_text: "Dispose Complaint", type: :text  },
        :agency_feedback => { name: :agency_feedback, target_field: "feedback_agency", target_model: "Forward", help_text: "Agency Feedback", submit_text: "Add Feedback", type: :text  },
        :call_center_feedback => {  name: :call_center_feedback, target_field: "call_center_feedback", target_model: "Forward", help_text: "Call Center Feedback", submit_text: "Add Feedback", type: :text  },
        :dcw_feedback => {  name: :dcw_feedback, target_field: "feedback_dcw", target_model: "Forward", help_text: "DCW Feedback", submit_text: "Add Feedback", type: :text  },
        :interim_remarks => { name: :interim_remarks, target_field: "interim_remarks", target_model: "Forward", help_text: "Interim Remarks", submit_text: "Add Remarks" , type: :text },
        :final_remarks => { name: :final_remarks, target_field: "final_remarks", target_model: "Forward", help_text: "Final Remarks", submit_text: "Add Remarks", type: :text  },
        :add_reply => { name: :add_reply, target_field: "reply_attachment", target_model: "Forward",  help_text: "Reply File", submit_text: "Add Reply", type: :file  }
      }
    end

    def action_params
      params.require(:complaint).permit(:action_data)
    end

    def complaint_recieve_params
      params.require(:complaint).permit(:file, :brief_of_complaint, :prayers,
        :organization_id,:next_target_date, :category)
    end
end
