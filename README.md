# Kele
#### A Ruby Gem API client to access the Bloc API.
Bloc's API provides an external facing JSON Web Token authorized gateway to the Bloc application. The Kele API Client provides easy access to and use of the student endpoints of Bloc's API.

## System Dependencies
* [httparty](https://johnnunemaker.com/httparty/) version **~> 0.13**
* [json](https://github.com/flori/json/tree/master) version **>= 1.8.3**

## Prerequisites
This gem was built using **Ruby 2.4**.
## Getting Started
Kele is a Ruby Gem, so it can be added to an application (in `Gemfile`) or within a Ruby shell.

To run in a Ruby shell:
1. Clone and move to the directory.
3. Start the shell.
4. `require ./lib/kele.rb` to load the methods.
5. Initialize a new instance of Kele by executing `kele = Kele.new(email, password)`, using the email and password passed as Strings that you use to access your Bloc account.
6. Call a method on the `kele`

## Methods

| **Method Name** | **Arguments** | **Description** |
| :---: | :---: | --- |
| `get_me` | _none_ | Retrieves current user |
| `get_mentor_availability` | `mentor_id` | Gets a list of a mentor's available time slots |
| `get_roadmap` | `roadmap_id` | Finds current user's roadmap divided into sections and checkpoints |
| `get_checkpoint` | `checkpoint_id` | Retrieves a checkpoint with its associated body and assignment |
| `create_submission` | `checkpoint_id`, `assignment_branch`, `assignment_commit_link`, `comment` | Submits a checkpoint assignment |
| `get_messages` | `page` (optional) | Shows message threads for current user by page. Returns a specified page when passed an integer |
| `create_message` | `recipient_id`, `token` (optional), `subject`, `message` | Creates a new message for an existing conversation thread when passed `token` or creates a new thread |
