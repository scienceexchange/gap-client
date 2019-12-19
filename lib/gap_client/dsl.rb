require 'gap_client'

module GapClient
  module DSL
  end
end

require 'gap_client/dsl/attachments'
require 'gap_client/dsl/users'
require 'gap_client/utils'

module GapClient
  module DSL
    include Attachments
    include Users
    include Utils
  end
end

