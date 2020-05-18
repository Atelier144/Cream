class UsersController < ApplicationController
  protect_from_forgery :except => ["logout"]
  def login

  end

  def logout
    session[:user_id] = nil
    redirect_to("/")
  end

  def index
  end

  def show
  end

  def login_form
  end

  def signup_form
  end

  def signup_done
  end

  def signup_certificated
  end

  def forgot_password_form
  end

  def forgot_password_done
  end

  def reset_password_form
  end

  def reset_password_done
  end

  def profile_form
  end

  def profile_done
  end

  def skillset_form
    @skills = UserSkill.where(user_id: @current_user.id)
  end

  def skillset_get_skill
    @skill = Skill.find_by(name: params[:name])
    if @skill
      render json: @skill
    else
      @skills = Skill.where('name LIKE ?', "#{params[:name]}%")
      render json: @skills
    end
  end

  def skillset_add_skill
    skill = UserSkill.new(user_id: @current_user.id, skill_id: params[:skill_id])
    skill.save
    @skills = UserSkill.where(user_id: @current_user.id)
    render json: @skills

  end
  def portfolio_index
  end

  def update_portfolio_form
  end

  def update_portfolio_done
  end

  def create_portfolio_form
  end

  def create_portfolio_done
  end

  def invitation_form
  end

  def email_form
  end

  def email_done
  end

  def password_form
  end

  def password_done
  end

  def sns_form
  end

  def sns_done
  end

  def resign_form
  end

  def resign_done
  end

  def new_email_done
  end

  def twitter_callback
    auth_hash = request.env["omniauth.auth"]
    @provider = auth_hash[:provider]
    @uid = auth_hash[:uid]
    @name = auth_hash[:info][:name]
    @image = auth_hash[:info][:image]
    @description = auth_hash[:info][:description]
    @url = auth_hash[:info][:urls][:Website]
    @twitter_url = auth_hash[:info][:urls][:Twitter]
    @location = auth_hash[:info][:location]
    @access_token = auth_hash[:credentials][:token]
    @access_token_secret = auth_hash[:credentials][:secret]

  end

  def twitter_post
    if params[:provider] == "twitter"
      twitter_user = User.find_by(twitter_uid: params[:uid])
      if twitter_user
        if session[:user_id] #On Login(Twitter Connection Error)
          flash[:twitter_connection_error] = "そのTwitterアカウントは既に使用されています"
          redirect_to("/settings/sns")
        else # Twitter Login
          session[:user_id] = twitter_user.id
          redirect_to("/")
        end
      else
        if session[:user_id] # Twitter Connection
          current_user = User.find_by(id: session[:user_id])
          current_user.twitter_uid = params[:uid]
          current_user.twitter_url = params[:twitter_url]
          current_user.twitter_token = params[:access_token]
          current_user.twitter_token_secret = params[:access_token_secret]
          if current_user.save
            redirect_to("/settings/sns/done/connect-twitter")
          else
            flash[:notice] = "Twitterとの連携に失敗しました"
            redirect_to("/settings/sns")
          end
        else # Twitter Signup
          permalink = generate_random_token(16)
          password = generate_random_token(30)
          new_user = User.new(
              permalink: permalink,
              name: params[:name],
              password: password,
              password_confirmation: password,
              remote_image_url: params[:image],
              url: params[:url],
              twitter_uid: params[:uid],
              twitter_url: params[:twitter_url],
              twitter_token: params[:access_token],
              twitter_token_secret: params[:access_token_secret],
              description: params[:description],
              location: params[:location]
          )

          if new_user.save
            session[:user_id] = User.find_by(twitter_uid: params[:uid]).id
            redirect_to("/signup/done")
          else
            flash[:notice] = "Twitterでの新規登録に失敗しました"
            redirect_to("/signup")
          end
        end
      end
    else #params[:provider] == "twitter"
      flash[:notice]= "Twitter認証に失敗しました"
      redirect_to("/")
    end
  end
  def github_callback
    auth_hash = request.env["omniauth.auth"]
    @provider = auth_hash[:provider]
    @uid = auth_hash[:uid]
    @name = auth_hash[:info][:name]
    @image = auth_hash[:info][:image]
    @description = auth_hash[:info][:description]
    @url = auth_hash[:info][:urls][:Blog]
    @github_url = auth_hash[:info][:urls][:GitHub]
    @location = auth_hash[:info][:location]
  end

  def github_post

  end

  def auth_failure
    redirect_to("/")
  end

  private

  def generate_random_token(length)
    return_value = ""
    for _ in 1..length
      code = rand(36).to_s(36)
      return_value += code
    end
    return return_value
  end
end
