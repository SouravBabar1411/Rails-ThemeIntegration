class RegistrationsController < DeviseTokenAuth::RegistrationsController
    # GET /resource/sign_up
  def create
    user = User.new(sign_up_params)
    if user.save 
      render_success 200, true, 'User created successfully', user.as_json
    else
      render_success 401, false, 'Enter valid details'
    end
  end

  private
  def sign_up_params
    params.require(:user).permit(:email,:password,:password_confirmation,:uid,:provider,:name,:phone)
  end
end