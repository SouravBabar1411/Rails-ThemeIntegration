class AchievementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_achievement, only: [:update, :show, :destroy]

 # GET /achievements
 def index
   @achievements = Achievement.all
   render_success 200, true, 'Achievement fetched successfully', @achievements.as_json
 end

 # GET /achievements/1
 def show
  render_success 200, true, 'Achievement fetched successfully', @achievement.as_json
 end

 # POST /achievements
 def create
   @achievement = Achievement.new(achievement_params)
    if @achievement.save
      render_success 200, true, 'Achivement created successfully', @achievement.as_json
    else
      if @achievement.errors
        errors = @achievement.errors.full_messages.join(", ")
      else
        errors = 'achievement creation failed'
      end
      return_error 500, false, errors, {}
    end
 end

 # PATCH/PUT /achievements/1
 def update
    if @achievement.update(status_params) && current_user.admin?
     render_success 200, true, 'achievement updated successfully', @achievement.as_json
    else
      if @achievement.errors
        errors = @achievement.errors.full_messages.join(", ")
      else
        errors = 'achievement update failed'
      end
      return_error 500, false, 'only admin can update achievement'
    end
  end

 # DELETE /achievements/1
 def destroy
   @achievement.destroy
   render_success 200, true, 'achievement deleted successfully', {}
 end

 private
   # Use callbacks to share common setup or constraints between actions.
   def set_achievement
     @achievement = Achievement.find(params[:id])
   end

   # Only allow a trusted parameter "white list" through.
   def achievement_params
      params.require(:achievement).permit(:award, :medal, :user_id)
   end

   #method for status
   def status_params
     params.require(:achievement).permit(:status)
   end
end