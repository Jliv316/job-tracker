class CommentsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.new(comment_params)
    if @comment.save
      flash[:success] = "Created comment: #{@comment.body}"
      redirect_to company_job_path(@job.company, @job)
    else
      redirect_to company_job_path(@job.company, @job)
    end
  end


  def comment_params
    params.require(:comment).permit(:body, :job_id)
  end
end