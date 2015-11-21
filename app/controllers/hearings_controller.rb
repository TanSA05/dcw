class HearingsController < ApplicationController
  include HearingsHelper

	before_action :authenticate_user!
  before_action :set_complaint

  helper_method :sort_column, :sort_direction

  def index
    if @complaint.hearing?
      @hearings = @complaint.hearings.order(sort_column + ' ' + sort_direction).page(params[:page])
    else
      redirect_to root_path, error: "Not in hearings"
    end
  end

  def show
    @hearing = Hearing.find_by_id(params[:hid])
    unless @hearing
      not_found
    end
  end

  def new
    if @complaint.hearing?
      @hearing = Hearing.new
      @hearing.complaint = @complaint
    else
      redirect_to root_path, error: "Not in hearing stage"
    end
  end

  def create
    @hearing = Hearing.new(hearing_params)
    @hearing.complaint = @complaint
    if @hearing.save
      flash[:notice] = "Hearing created successfully!"
      redirect_to actions_complaint_path @complaint
    else
      Logger.warn "Hearing creation failed: " + @hearing.inspect
      flash[:error] = "Hearing creating failed"
      render 'new'
    end
  end

  private
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    def hearing_params
      params.require(:hearing).permit(:complainant_present,:complainant_called,
        :other_summoned,:other_present,:respondent_summoned_if_person,:respondent_summoned_if_agency,
        :respondent_present_if_person,:respondent_present_if_agency,:date,:remarks)
    end

    def sort_column
      Hearing.column_names.include?(params[:sort]) ? params[:sort] : "date"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
