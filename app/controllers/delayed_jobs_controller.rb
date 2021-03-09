class DelayedJobsController < ApplicationController
  update_progress(step: 10)  # increase the progress_current for step
  update_stage('name of stage')  # change the progress_stage
  update_stage_progress('name of stage', step: 11)  # change progress_stage and increase progress_current for step
  update_progress_max(progress_max) # change progress_max
end
