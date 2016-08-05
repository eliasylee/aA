class NotesController < ApplicationController
  before_action :author?, only: [:destroy]

  def create
    @note = Note.new(note_params)
    @note.save!
    redirect_to track_url(params[:track_id])
  end

  def destroy
    @note = Note.find_by_id(params[:id])

    if current_user != @note.author
      render text: "403 FORBIDDEN: You are not this note's author,"
    end

    @note.destroy
    redirect_to track_url(params[:track_id])
  end

  private

  def note_params
    params.require(:note).permit(:track_id, :user_id, :body)
  end
end
