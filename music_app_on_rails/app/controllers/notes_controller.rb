class NotesController < ApplicationController

  def create
    @note = Note.new(note_params)
    @note.save
    redirect_to track_url(params[:track_id])
  end

  def destroy
    @note = Note.find_by_id(params[:id].to_i)

    if current_user != @note.user
      render text: "403 FORBIDDEN: You are not this note's author,"
    else
      @note.destroy
      redirect_to track_url(@note.track)
    end
  end

  private

  def note_params
    params.require(:note).permit(:track_id, :user_id, :body)
  end
end
