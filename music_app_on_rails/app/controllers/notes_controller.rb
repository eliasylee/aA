class NotesController < ApplicationController
  def new
    @note = Note.new
    render :new
  end

  def create
    @note = Note.new(:note_params)
    @note.save
    redirect_to track_url(@note.track)
  end

  def edit
    @note = Note.find_by_id(params[:id])
    render :edit
  end

  def update
    @note = Note.find_by_id(params[:id])

    if @note.update(note_params)
      redirect_to track_url(@note.track)
    else
      flash.now[:errors] = @note.errors.full_messages
      render :edit
    end
  end

  def destroy
    @note = Note.find_by_id(params[:id])
    @note.destroy
    redirect_to track_url(@note.track)
  end

  private

  def note_params
    params.require(:note).permit(:track_id, :note_id, :body)
  end
end
