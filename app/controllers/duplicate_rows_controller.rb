class DuplicateRowsController < ApplicationController
  def index
    @duplicate_rows = DuplicateRow.where(resolved: false)
  end
  def next_unresolved
    row = DuplicateRow.where(:resolved => false).first
    redirect_to :action => 'show', :id => row.id
  end
  def select_image
    delete_ids = params[:all_values].reject { |r| r == params[:selected_image] }
    sel = Picture.find(params[:selected_image])
    delete_ids.each do |pic_id|
      pic =  Picture.find(pic_id)  
      puts "deleting file #{pic.file_name}"
      File.delete(pic.file_name)
    end
    row = DuplicateRow.find(params[:id])
    row.resolved = true
    row.save
    redirect_to :action => 'next_unresolved'
  end
  def show
    @duplicate_row = DuplicateRow.find(params[:id])
  end
end
