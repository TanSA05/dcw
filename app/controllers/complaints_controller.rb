class ComplaintsController < ApplicationController
  include ComplaintsHelper

  before_action :set_complaint, only: [:show, :edit, :update, :destroy, :timeline, :status]
  before_action :set_new_complaint, only: [:new,:new_public]
  before_action :only_dcw, only: [:create, :recieve, :recieved, :unregistered]
  before_action :authenticate_user!, except: [:new_public,:create_public, :public_search, :status, :do_public_search]
  helper_method :sort_column, :sort_direction

  def index
    if params[:search].present?
      @complaints = Complaint.search params[:search],
        page: params[:page], per_page: 20, order: {sort_column.to_sym => sort_direction.to_sym}
    else
      @complaints = Complaint.all.order(sort_column + ' ' + sort_direction).page(params[:page])
    end
  end

  def your_complaints
    @complaints = current_user.complaints.search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page])
  end

  def unregistered
    @complaints = Complaint.where(organization: nil).search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page])
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
        format.html { redirect_to status_complaint_path(@complaint), notice: 'Complaint was successfully created.' }
      else
        format.html { render :new_public }
      end
    end
  end

  def status

  end

  def public_search

  end

  def do_public_search
    complaint_number = params[:complaint_number]
    contact_number = params[:contact_number]
    complaint = Complaint.where(complaint_number: complaint_number, contact_number_of_complainant: contact_number)
    if complaint.size == 1
      redirect_to status_complaint_path(complaint.first)
    else
      flash[:error] = "Complaint not found"
      render :public_search
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

    def sort_column
      Complaint.column_names.include?(params[:sort]) ? params[:sort] : "complaint_number"
    end

    def hearing_sort_column
      Hearing.column_names.include?(params[:sort]) ? params[:sort] : "date"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
