require_relative '../ethereum-microservice/renderer'

namespace :render do
  desc 'Render configuration and compose files and keys'
  task :config do
    renderer = Opendax::Renderer.new
    renderer.render
  end
end
