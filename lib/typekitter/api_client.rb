module Typekitter
  class ApiClient
    ENDPOINTS = {
      kits_index: 'https://typekit.com/api/v1/json/kits'
    }

    def kits_index
      kits = Typhoeus.get(
        ENDPOINTS[:kits_index],
        headers: { 'X-Typekit-Token' => Typekitter::Token.load.value }
      )

      if kits.success?
        JSON.parse(kits.body)
      else
        error_message(kits.body)
      end
    end

    def kits_create(options={})
      kit = Typhoeus.post(
        ENDPOINTS[:kits_index],
        headers: { 'X-Typekit-Token' => Typekitter::Token.load.value },
        body: {
          name: options[:name],
          domains: options[:domains],
          families: options[:families],
          segmented_names: options[:segmented_names]
        }
      )

      if kit.success?
        JSON.parse(kit.body)
      else
        error_message(kit.body)
      end
    end

    private

    def error_message(description)
      "An error occured: #{description}"
    end
  end
end
