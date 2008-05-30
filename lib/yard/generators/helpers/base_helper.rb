module YARD::Generators::Helpers
  module BaseHelper
    # This is used a lot by the HtmlHelper and there should
    # be some helper to "clean up" text for whatever, this is it.
    def h(text)
      text
    end
    
    def linkify(*args) 
      # The :// character sequence exists in no valid object path but just about every URL scheme.
      if args.first.is_a?(String) && args.first.include?("://")
        link_url(*args)
      else
        link_object(*args)
      end
    end

    def link_object(object, title = nil)
      return title if title
      
      case object
      when YARD::CodeObjects::Base, YARD::CodeObjects::Proxy
        object.path
      when String, Symbol
        P(object).path
      else
        object
      end
    end
    
    def link_url(url)
      url
    end
    
    def format_object_name_list(objects)
      objects.sort_by {|o| o.name.to_s.downcase }.join(", ")
    end
    
    def format_types(list, brackets = true)
      list.empty? ? "" : (brackets ? "[#{list.join(", ")}]" : list.join(", "))
    end
  end
end