Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "https://masajid.rabeh.sy", "localhost:5173"

    resource "*",
      headers: :any,
      methods: [ :get, :post, :put, :patch, :delete, :options, :head ],
      credentials: true
  end
end
