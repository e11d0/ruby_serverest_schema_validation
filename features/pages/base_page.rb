# frozen_string_literal: true

class Base
  include HTTParty
  base_uri 'https://serverest.dev'
  headers 'Content-Type': 'application/json'
end
