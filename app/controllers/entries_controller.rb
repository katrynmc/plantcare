class EntriesController < ApplicationController
  http_basic_authenticate_with name: ENV["EDITOR_NAME"], password: ENV["EDITOR_PASSWORD"], except: [:index, :show]

  def index
    @entries = Entry.all.sort_by &:date
  end

  def show
    @entry = Entry.find(params[:id])

    entries = Entry.all.sort_by &:date
    current_index = entries.find_index { |entry| entry.id == @entry.id }

    @next = current_index < entries.length - 1 ? current_index + 1 : current_index
    @previous = current_index > 0 ? current_index - 1 : 0
  end

  def new
    @entry = Entry.new(date: Date.today)
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to @entry
    else
      render "new"
    end
  end

  def update
    @entry = Entry.find(params[:id])

    if @entry.update(entry_params)
      redirect_to @entry
    else
      render "edit"
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    redirect_to entries_path
  end

  private
    def entry_params
      params.require(:entry).permit(:title, :text, :leaf_count, :plant_observations, :date)
    end
end
