# frozen_string_literal: true

# usuario_page
class Usuario < Base
  def usuario_post(payload)
    self.class.post('/usuarios', body: payload.to_json)
  end

  def usuario_get(id)
    self.class.get("/usuarios/#{id}")
  end

  def usuario_put(id, payload)
    self.class.put("/usuarios/#{id}", body: payload.to_json)
  end

  def usuario_delete(id)
    self.class.delete("/usuarios/#{id}")
  end

  def usuario_search(query); end

  def usuario_retornarumid(payload)
    # cadastra um usuario e retorna o id
    usuariopostid = Usuario.new.usuario_post(payload)
    usuariopostid['_id']
  end
end
