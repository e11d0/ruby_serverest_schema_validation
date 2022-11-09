# frozen_string_literal: true

# login_page
class Login < Base
  def login_post(payload)
    self.class.post('/login', body: payload.to_json)
  end

  def login_retorna_token(payload)
    # realiza o login e retorna o token
    logintoken = Login.new.login_post(payload)
    logintoken['authorization']
  end
end
