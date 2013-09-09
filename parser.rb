require 'nokogiri'

module AwesomeParser
  def AwesomeParser.parse(resource)
    def find_phones(node)

    end


    page = Nokogiri::HTML(resource)

    phones = page.xpath "//a[starts-with(@href, \"mailto:\")]"
    phones.map do |node|
      email = node[:href]
      email.slice! "mailto:"

      #somewhat naive way to find phone - look at sibling nodes, then on parent sibling nodes
      phone = find_phone(node)
      unless phone.first
        phone = find_phone(node.parent)
      end

      actual_phone = if phone.first then phone.first else "-" end

      {:name => email, :title => "director", :phone => actual_phone, :email => email}
    end
  end

  def self.find_phone(node)
    results = node.parent.inner_text.scan /\d\d\d.\d\d\d.\d\d\d\d/
    results
  end
end


