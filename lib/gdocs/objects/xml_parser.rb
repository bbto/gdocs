# This class is the one that will parse the xml
module Gdocs
  module Objects
    class XmlParser
      # Parses the xml string and returns an object that holds the different attributes the xml defined.
      def parse(xml_string)

      end
      
      # Redefining 
      def method_missing(m, *args, &block)
        if attributes.include?(m.to_s.gsub("=",""))
          if m.to_s.include?("=")
            self.attributes[m.to_s.gsub("=","")] = *args.to_s
          else
            result = self.attributes[m.to_s]
          end
        else
          raise NoMethodError.new("Method missing #{m}")
        end
      end
      
      def attributes
        return []
      end
    end
  end
end