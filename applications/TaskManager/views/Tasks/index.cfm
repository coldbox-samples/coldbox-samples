<cfoutput>
<cfsavecontent variable="js">
<script language="JavaScript">
function status(completed,taskID){$
	var data = {completed:completed,taskID:taskID}
	$.post('#event.buildLink("tasks.changeStatus")#',data, 
		   function(data){
		   	if( data.error ){
				alert(data.message);
			}
			else{
				$("##task_"+taskID).slideUp("slow").remove();
			}
		   },"json")
}
</script>
</cfsavecontent>
<cfhtmlhead text="#js#">
<h1>IECFUG Tasks</h1>

<cfif flash.exists("message")>
	<div id="infobox">#flash.get("message")#</div>
</cfif>

<a href="#event.buildLink('tasks.editor')#">Create Task</a>

<br/><br/>

<a href="#event.buildLink('tasks.list.active')#"><cfif rc.status eq "active">> </cfif>Active Tasks (<a href="#event.buildLink('tasks/feed')#">RSS</a>)</a> |
<a href="#event.buildLink('tasks.list.completed')#"><cfif rc.status eq "completed">> </cfif>Completed Tasks (<a href="#event.buildLink('tasks/feed/status/completed')#">RSS</a>)</a>

<table width="90%">
	<tr>
		<th width="20"></th>
		<th>Task</th>
		<th width="150">Actions</th>
	</tr>
	<cfloop array="#rc.tasks#" index="task">
		<tr id="task_#task.getTaskID()#">
			<td><input type="checkbox" name="taskid" id="taskID" onclick="status('#not task.getIsCompleted()#','#task.getTaskID()#')" <cfif task.getIsCompleted()>checked="checked"</cfif> /></td>
			<td>
				<strong>#task.getSubject()#</strong>
			</td>
			<td>
				<a href="#event.buildLink('tasks.editor.taskid.' & task.getTaskID())#">edit</a> |
				
				<a href="#event.buildLink('tasks.remove')#/taskid/#task.getTaskID()#" onClick="return confirm('Really Delete Task?')">delete</a>
			</td>
		</tr>
	</cfloop>
</table>

</cfoutput>