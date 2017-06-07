# == Schema Information
#
# Table name: emails
#
#  id                      :integer          not null, primary key
#  model_id                :integer
#  mailer_classname        :string
#  recipients              :text
#  options                 :text
#  status_cd               :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  email_preferences_token :string
#  token_expiration_dttm   :datetime
#  participant_id          :integer
#  options_json            :jsonb
#  mailer_id               :integer
#
# Indexes
#
#  index_emails_on_mailer_id  (mailer_id)
#
# Foreign Keys
#
#  fk_rails_da93b5a271  (mailer_id => mailers.id)
#

class Email < ApplicationRecord
  belongs_to :mailer

  as_enum :status, [:sent, :paused, :mandrill_sent, :mandrill_bounced], map: :string
end