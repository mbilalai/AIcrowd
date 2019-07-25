# frozen_string_literal: true
class Team::Invitee::InvitationAcceptedNotificationMailer < Team::BaseMailer
  def sendmail(participant_id:, team_id:)
    @participant = Participant.find(participant_id)
    @team = Team.find(team_id)
    mandrill_send(format_options)
  end

  def email_subject
    "Welcome to Team #{@team.name}"
  end

  def email_body_html
    other_team_member_count = @team.team_participants.count - 1
    x_other_people = "#{other_team_member_count} other #{other_team_member_count == 1 ? 'person' : 'people'}"
    <<~HTML
      <div>
        <p>You’ve just joined Team #{linked_team_html}!</p>
        <p>
          You will now be collaborating with #{x_other_people} on #{linked_challenge_html}.
          A submission by any one of you will count the same for all of you on the
          leaderboards. Good luck on the challenge!
        </p>
        #{signoff_html}
      </div>
    HTML
  end

  def notification_reason
    'You joined a team.'
  end
end
