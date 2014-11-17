class ReportEntry < ActiveRecord::Base
  belongs_to :outlet
  belongs_to :shift
  belongs_to :user
  has_paper_trail
end
