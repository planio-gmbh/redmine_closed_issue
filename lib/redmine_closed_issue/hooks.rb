module RedmineClosedIssue
  class ControllerHooks < Redmine::Hook::ViewListener
    def controller_issues_new_before_save(context={})
      if context[:issue] and context[:issue].status.is_closed? then
        context[:issue].closed_date = Time.now
      end
    end

    def controller_issues_edit_before_save(context={})
      if context[:issue] && context[:issue].status_id_changed?
        if context[:issue].status.is_closed?
          context[:issue].closed_date = Time.now
        else
          context[:issue].closed_date = nil if(context[:issue].closed_date)
        end
      end
    end
    alias_method :controller_issues_bulk_edit_before_save, :controller_issues_edit_before_save
  end
end
