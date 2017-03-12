class APIUtil
  def self.open_table_get(url)
    HTTParty.get(url, headers: AUTH_HEADER)
  end

  def self.open_table_post(url, data)
    headers = AUTH_HEADER.dup
    headers['Content-Type'] = 'application/json'
    HTTParty.post(url, body: data.to_json, headers: headers)
  end
end
