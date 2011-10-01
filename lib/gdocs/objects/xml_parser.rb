# This class is the one that will parse the xml
module Gdocs
  module Objects
    class XmlParser
      
      # Parses the xml string and returns an object that holds the different attributes the xml defined.
      def self.parse(xml_string)
        [Object.new, Object.new, Object.new]
      end
      
      # Redefining
      def method_missing(m, *args, &block)
        if instance_attributes.include?(m.to_s.gsub("=",""))
          if m.to_s.include?("=") #this should change when we stablish how are we going to parse the response.
            self.parsed_attributes[m.to_s.gsub("=","")] = *args.to_s
          else
            result = self.parsed_attributes[m.to_s]
          end
        else
          raise NoMethodError.new("Method missing #{m}")
        end
      end
      
      def instance_attributes
        return [] #should return a static array with all the attributes of this class 
      end
      
      def parsed_attributes
       return nil #should return the parsed response 
      end
      
    end
  end
end