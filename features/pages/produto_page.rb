# frozen_string_literal: true

# produto_page
class Produto < Base
  def produto_post(payload, auth)
    self.class.post('/produtos', body: payload.to_json,
                                 headers: { "Content-Type": 'application/json', "Authorization": auth })
  end

  def produto_get_id(id)
    self.class.get("/produtos/#{id}")
  end

  def produto_put(id, payload,auth)
    self.class.put("/produtos/#{id}", body: payload.to_json,
                                      headers: { "Content-Type": 'application/json', "Authorization": auth })
  end

  def produto_delete(id,auth)
    self.class.delete("/produtos/#{id}",
                                      headers: { "Content-Type": 'application/json', "Authorization": auth })
  end

  def produto_retornarumid(payload,auth)
    # cadastra um produto e retorna o id
    produtopostid = produto.new.produto_post(payload, auth)
    produtopostid['_id']
  end
end
