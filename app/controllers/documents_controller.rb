class DocumentsController < ApplicationController
  
  def show
    product = Product.find(params[:id])
    @documet = Document::DownloadService.new(product).export_csv
    respond_to do |format|
      format.csv { send_data @documet , filename: "Lista-#{Date.today}.csv" }
    end
  end
end