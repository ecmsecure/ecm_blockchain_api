# frozen_string_literal: true

require_relative "ecm_blockchain_api/version"
require_relative "ecm_blockchain_api/client"
require_relative "ecm_blockchain_api/routes"
require_relative "ecm_blockchain_api/request"
require_relative "ecm_blockchain_api/errors"
require_relative "ecm_blockchain_api/models/member"
require_relative "ecm_blockchain_api/models/asset_model"
require_relative "ecm_blockchain_api/models/token_model"
require_relative "ecm_blockchain_api/models/token_collection"
require_relative "ecm_blockchain_api/models/data_file_model"
require_relative "ecm_blockchain_api/models/data_content_model"
require_relative "ecm_blockchain_api/models/custom_attribute"
require          "httparty"
require          "logger"
require          "active_model"

require  "ecm_blockchain_api/ca"
require  "ecm_blockchain_api/asset"
require  "ecm_blockchain_api/token"

module ECMBlockchain
  require "pry"

  class << self
    attr_accessor :access_token, :logger, :base_url
    
    def has_api_key?
      return unless ECMBlockchain.access_token.to_s.empty?
      raise Unauthorized.new( 
        message: "You need to set your access_token", 
        code: 401,
        name: Unauthorized)  
    end
  end

  @logger = Logger.new(STDOUT)
  @base_url = "https://api.ecmsecure.com/v1"
end
