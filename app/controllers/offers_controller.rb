class OffersController < ApplicationController
  before_action :set_offer, only: ['show', 'edit', 'update', 'destroy']

  def index
    @offers = Offer.all
    respond_to do |format|
      format.html 
      format.csv { send_data @offers.to_csv(['title', 'description', 'start_date', 'end_date']) }
    end
  end
 
  def show
  end

 
  def new
    @offer = offer.new
  end

  def edit
  end

  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to offer_url(@offer), notice: "offer was successfully created." }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to offer_url(@offer), notice: "offer was successfully updated." }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to offers_url, notice: "offer was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def fetch_offers
    #binding.pry
    offers = offer.all
    search_string = []
    filter_query = ''

    ## Check if Search Keyword is Present & Write it's Query
    if params.has_key?('search') && params[:search].has_key?('value') && params[:search][:value].present?
      search_columns.each do |term|
        search_string << "#{term} ILIKE :search"
      end
      offers = offers.where(search_string.join(' OR '), search: "%#{params[:search][:value]}%")
    end

    if params["filters"].present?
      filters = JSON.parse(params["filters"].gsub("=>", ":").gsub(":nil,", ":null,"))
      offers = offers.offer_side_bar_filter(filters)
    end

    offers = offers.order("#{sort_column} #{datatable_sort_direction}") unless sort_column.nil?
    offers = offers.page(datatable_page).per(datatable_per_page)

    render json: {
        offers: offers.as_json(type: 'list'),
        draw: params['draw'].to_i,
        recordsTotal: offers.count,
        recordsFiltered: offers.total_count,
    }
  end

  private

    ## Datatable Column List om which search can be performed
    def search_columns
      %w(title description)
    end

    ## Datatable Column List on which sorting can be performed
    def sort_column
      columns = %w(name points completions clicks start created_at)
      columns[params[:order]['0'][:column].to_i - 1]
    end


    def set_offer
      @offer = offer.find(params[:id])
    end

 
    def offer_params
      params.require(:offer).permit(:title, :description, :start_date, :end_date)
    end
end
