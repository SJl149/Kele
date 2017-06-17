module Checkpoint
  BASE_URI = "https://www.bloc.io/api/v1"

  def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)
    options = {
      body: {
        assignment_branch: assignment_branch,
        assignment_commit_link: assignment_commit_link,
        checkpoint_id: checkpoint_id,
        comment: comment,
        enrollment_id: 26991
      },
      headers: {
        "authorization" => @auth_token
      }
    }

    response = self.class.get(BASE_URI + "/checkpoint_submissions", options)
    json_body = response.body
    JSON.parse(json_body)
  end
end
