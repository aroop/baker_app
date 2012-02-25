BakerApp::Application.routes.draw do
  mount BakerServer::Engine => "/"
end
