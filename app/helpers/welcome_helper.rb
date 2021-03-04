module WelcomeHelper

  def menu_tag(array,&block)
    return unless array
    haml_tag :ul do
      array.each do |key,node|
        attributes = {}
        if block_given?
          text = yield(attributes, node)
        else
          text = node["title"]
        end
        haml_tag :li, text, attributes
        menu_tag(node["children"],&block)
      end
    end
  end

end
