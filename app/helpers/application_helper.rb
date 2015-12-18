module ApplicationHelper
  def link_to_add_fields label, f, assoc
    new_obj = f.object.class.reflect_on_association(assoc).klass.new
    fields = f.fields_for assoc, new_obj, child_index: "new_#{assoc}" do |task|
      render "#{assoc.to_s}_form", f: task
    end
    link_to label, "#", onclick:
      "add_fields(this, \"#{assoc}\",\"#{escape_javascript(fields)}\")",
        remote: true
  end

  def link_to_remove_fields label, f
    field = f.hidden_field :_destroy
    link = link_to label, "#", onclick: "remove_fields(this)", remote: true
    field + link
  end

  def course_completed_percentage
    completed_tasks = UserSubject.completed_tasks(current_user).count
    percentage = completed_tasks*100/UserSubject.total_tasks(current_user).count
  end
end