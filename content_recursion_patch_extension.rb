# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class ContentRecursionPatchExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/content_recursion_patch"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :content_recursion_patch
  #   end
  # end
  
  def activate
    # admin.tabs.add "Content Recursion Patch", "/admin/content_recursion_patch", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Content Recursion Patch"
  end
  
end
