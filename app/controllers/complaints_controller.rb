class ComplaintsController < ApplicationController
  include ComplaintsHelper

  before_action :set_complaint, only: [:show, :edit, :update, :destroy, :recieve, :recieved, :actions, :timeline, :hearings, :add_hearing, :hearing]
  before_action :set_new_complaint, only: [:new,:new_public]
  before_action :only_dcw, only: [:create, :recieve, :recieved, :unregistered]
  before_action :authenticate_user!, except: [:new_public]

  helper_method :sort_column, :sort_direction

  def index
    @complaints = Complaint.search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page])
  end

  def your_complaints
    @complaints = current_user.complaints.search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page])
  end

  def unregistered
    @complaints = Complaint.where(organization: nil).search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page])
  end

  def recieve
    unless @complaint.may_recieve?
      redirect_to root_path, error: "Already recieved"
    end
  end

  def hearings
    if @complaint.hearing?
      @hearings = @complaint.hearings
    else
      redirect_to root_path, error: "Not in hearings"
    end
  end

  def hearing
    @hearing = Hearing.find_by_id(params[:hid])
    unless @hearing
      not_found
    end
  end

  def add_hearing
    if @complaint.hearing?
      @hearing = Hearing.new
      @hearing.complaint = @complaint
    else
      redirect_to root_path, error: "Not in hearings"
    end
  end

  def added_hearing
    #todo
  end

  def create
    @complaint = Complaint.new(complaint_params)
    @complaint.next_target_date = Time.now + 2.days
    respond_to do |format|
      if @complaint.save
        #push to timeline
        format.html { redirect_to @complaint, notice: 'Complaint was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def create_public
    @complaint = Complaint.new(complaint_public_params)
    @complaint.next_target_date = Time.now + 2.days
    respond_to do |format|
      if @complaint.save
        #push to timeline
        format.html { redirect_to root_url, notice: 'Complaint was successfully created.' }
      else
        format.html { render :new_public }
      end
    end
  end

  def recieved
    if @complaint.recieve!
      respond_to do |format|
        if @complaint.update(complaint_recieve_params)
        #push to timeline
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
          end
          format.html { redirect_to @complaint, notice: 'Complaint was successfully recieved.' }
        else
          format.html { render :recieve }
        end
      end
    else
      redirect_unknown_error
    end
  end

  private
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    def set_new_complaint
      @complaint = Complaint.new
    end

    def complaint_params
      params.require(:complaint).permit(:complainant, :respondent_if_person, :respondent_if_agency,
       :contact_number_of_complainant, :address, :locality, :file)
    end

    def complaint_public_params
      params.require(:complaint).permit(:complainant, :respondent_if_person, :respondent_if_agency,
       :contact_number_of_complainant, :address, :locality, :brief_of_complaint, :prayers)
    end

    def complaint_recieve_params
      params.require(:complaint).permit(:file, :brief_of_complaint, :prayers,
        :organization_id,:next_target_date)
    end

    def sort_column
      Complaint.column_names.include?(params[:sort]) ? params[:sort] : "complaint_number"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
