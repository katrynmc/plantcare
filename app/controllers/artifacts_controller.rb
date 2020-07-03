class ArtifactsController < ApplicationController
  def create
    @entry = Entry.find(params[:entry_id])
    @artifact = @entry.artifacts.create(artifact_params)

    redirect_to entry_path(@entry)
  end

  private
    def artifact_params
      params.require(:artifact).permit(:src)
    end
end
