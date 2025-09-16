module Authenticable
  def current_user
    return @current_user if @current_user

    header = request.headers["Authorization"]
              .split(" ")
              .last
    return nil if header.nil?

    decode = JsonWebToken.decode(header)
    @current_user = User.find(decode["user"])
  end

  def authenticate_user!
    render json: { error: "Not Authorized" } unless current_user
  end
end
