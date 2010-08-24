<cfoutput>
<h1>Tasks.editor</h1>

[<a href="#event.buildLink('tasks')#"><< Go Back</a>]

<form action="#event.buildlink('tasks.save')#" method="post" name="editorForm">

<input type="hidden" name="taskid" id="taskID" value="#rc.task.getTaskID()#" />

<label for="subject">Subject: </label>
<input type="text" name="subject" id="subject" size="40" value="#rc.task.getSubject()#">
<br />
<label for="notes">Notes: </label>
<textarea name="notes" id="notes" rows="5" cols="50">#rc.task.getNotes()#</textarea>

<hr/>
<input type="submit" value="submit" />
</form>

</cfoutput>