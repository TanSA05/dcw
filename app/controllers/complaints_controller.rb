class ComplaintsController < ApplicationController
  before_action :set_complaint, only: [:show, :edit, :update, :destroy, :recieve, :recieved]
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

  def show
  end

  def new
    @complaint = Complaint.new
  end

  def new_public
    @complaint = Complaint.new
  end

  def recieve
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
          if @complaint.organization == Organization.first
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

  def destroy
    @complaint.destroy
    respond_to do |format|
      format.html { redirect_to complaints_url, notice: 'Complaint was successfully destroyed.' }
    end
  end

  private
    def set_complaint
      @complaint = Complaint.find(params[:id])
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
