class UsersController < ApplicationController
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
end
