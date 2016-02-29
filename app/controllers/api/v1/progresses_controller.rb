class Api::V1::ProgressesController < Api::V1::ApplicationController
  protect_from_forgery with: :null_session

  def save
    ucd = UserCourseStorage.where(user_id: params[:user_id], course_id: params[:course_id])[0]

    if ucd
      ucd.json_data=params[:progress].to_json
      ucd.save

      render json: {"errors":[]}
    else
      ucd = UserCourseStorage.new
      ucd.user_id = params[:user_id]
      ucd.course_id = params[:course_id]
    end
  end

  def status
    @count_of_player1_wins = 0
    @count_of_player2_wins = 0

    ucd = UserCourseStorage.where(user_id: params[:user_id], course_id: params[:course_id])[0]

    if ucd
      @count_of_player1_wins = JSON.parse(ucd.json_data)["player1_wins"].to_i
      @count_of_player2_wins = JSON.parse(ucd.json_data)["player2_wins"].to_i
    end
    #It always returns zero at players count of wins, haha
  end
end
