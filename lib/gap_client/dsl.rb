require 'gap_client'

module GapClient
  module DSL
  end
end

require 'gap_client/dsl/attachments'
require 'gap_client/dsl/cells'
require 'gap_client/dsl/emails'
require 'gap_client/dsl/forms'
require 'gap_client/dsl/frequencies'
require 'gap_client/dsl/frequency_units'
require 'gap_client/dsl/jobs'
require 'gap_client/dsl/lines'
require 'gap_client/dsl/runs'
require 'gap_client/dsl/tables'
require 'gap_client/dsl/users'
require 'gap_client/dsl/words'
require 'gap_client/utils'

module GapClient
  module DSL
    include Attachments
    include Cells
    include Emails
    include Forms
    include Frequencies
    include FrequencyUnits
    include Jobs
    include Lines
    include Runs
    include Tables
    include Users
    include Words
    include Utils
  end
end

