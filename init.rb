require 'redmine'
require 'dispatcher'
require 'redmine_closed_issue/hooks'

Redmine::Plugin.register :redmine_closed_issue do
  name 'Redmine Closed Date plugin'
  author 'Matheus Ashton Silva, Jan Schulz-Hofen (Planio GmbH)'
  description 'A plugin that saves the date when the issue is closed, and shows it on issue/show view'
  version '0.0.3'
  url 'https://github.com/planio-gmbh/redmine_closed_issue'
  author_url 'http://matheusashton.net'
end

Dispatcher.to_prepare do
  Query.send( :include, RedmineClosedIssue::Patches::IssueQueryPatch) unless Query.include?(RedmineClosedIssue::Patches::IssueQueryPatch)
end