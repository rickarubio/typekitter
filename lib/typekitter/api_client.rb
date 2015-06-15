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

    private

    def error_message(description)
      "An error occured: #{description}"
    end
  end
end
