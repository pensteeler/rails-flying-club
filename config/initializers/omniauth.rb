Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']

  #provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  provider :github, 8de212283dbfd02c545c, a9d591c3c9d94c341e50c91ac1a1fe16465e7e00
end
