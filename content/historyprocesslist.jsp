<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
      
            <div class="container-fluid">
                       <div class="row">
                    <div class="col-lg-12">
                    <div class="box ui-draggable ui-droppable">
				<div class="box-header">
					<div class="box-name">
						<i class="fa fa-coffee"></i> <span>已完成任务</span>
					</div>
					<div class="box-icons">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
						</a> <a class="expand-link"> <i class="fa fa-expand"></i>
						</a> <a class="close-link"> <i class="fa fa-times"></i>
						</a>
					</div>
					<div class="no-move"></div>
				</div>
				<div class="box-content">
                                <table id="grid-data" class="table table-condensed table-hover table-striped">
							        <thead>
							            <tr>
					                						                
							                				                
							               <th data-column-id="type">工程类型</th>
							                <th data-column-id="style">设施类型</th>							         
							                <th data-column-id="content">工程详细内容</th>
							                <th data-column-id="taskId">任务编号</th>							     							     
							                <th data-formatter="commands">操作</th>
							            </tr>
							        </thead>
							    </table>
                            </div>
                            </div>
                        </div>
                    </div>
	<div class="row">
		<div class="col-lg-12">
			<div class="box ui-draggable ui-droppable" id="dept">
				<div class="box-header">
					<div class="box-name">
						<i class="fa fa-search"></i> <span>已完成任务</span>
					</div>
					<div class="box-icons">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
						</a> <a class="expand-link"> <i class="fa fa-expand"></i>
						</a> <a class="close-link"> <i class="fa fa-times"></i>
						</a>
					</div>
					<div class="no-move"></div>
				</div>
				<div class="box-content">
						<form role="form" action="" method="post">
               
						             <div class="form-group">
						                <label>任务编号</label>
						                <input class="form-control" id="taskid" readonly="readonly">
						              </div>
						               <div class="form-group">
						                <label>渠道来源</label>
						                <input class="form-control" id="channel" readonly="readonly">
						              </div>
						              <div class="form-group">
						                <label>任务类型</label>
						                <input class="form-control" id="tasktype" readonly="readonly">
						              </div>
						               <div class="form-group">
						                <label>开始时间</label>
						                <input class="form-control" id="begintime" readonly="readonly">
						              </div>
						               <div class="form-group">
						                <label>结束时间</label>
						                <input class="form-control" id="endtime" readonly="readonly">
						              </div>
						              <div class="form-group">
						                <label>道路类型</label>
						                <input class="form-control" id="postype" readonly="readonly">
						              </div> 
						              <div class="form-group">
						                <label>施工位置</label>
						                <input class="form-contr ol" id="roadid" readonly="readonly">
						              </div> 
						              
						              <div class="form-group">
						                <label>工程类型</label>
						                <input class="form-control" id="type" readonly="readonly">
						              </div>
						              <div class="form-group">
						                <label>设施类型</label>
						                <input class="form-control" id="style" readonly="readonly">
						              </div> 
						             <div class="form-group">
						                <label>任务描述</label>
						                <input class="form-control" id="style" readonly="readonly">
						              </div>
						             
						           <div class="form-group">
						                <label>附件图片</label>
						                <input class="form-control" id="file" readonly="readonly">
						              </div>
						             <div class="form-group">
						                <label>发布人</label>
						                <input class="form-control" id="publishname" readonly="readonly">
						                <input class="form-control" id="publishdate" readonly="readonly">
						              </div>
						           <div class="form-group">
						                <label>施工人</label>
						                <input class="form-control" id="buildname" readonly="readonly">
						                <input class="form-control" id="builddate" readonly="readonly">
						                <input class="form-control" id="epicture" readonly="readonly">
						              </div>
						              <div class="form-group">
						                <label>验收人</label>
						                <input class="form-control" id="deptleaderacceptname" readonly="readonly">
						                <input class="form-control" id="deptleaderacceptdate" readonly="readonly">
						              </div>
						              <div class="form-group">
						                <label>验收人</label>
						                <input class="form-control" id="supervisoracceptname" readonly="readonly">
						                <input class="form-control" id="supervisoracceptdate" readonly="readonly">
						              </div>
						              <div class="form-group">
						                <label>验收人</label>
						                <input class="form-control" id="owneracceptname" readonly="readonly">
						                <input class="form-control" id="owneracceptdate" readonly="readonly">
						              </div>
						              <button id="btn" type="button" class="btn btn-default">完成</button>
                                </form>
				</div>
			</div>

		</div>
	</div>

</div>
            
            
            
    <script type="text/javascript">
    
    $(document).ready(function(){
    	$("#dept").hide();
	    var grid=$("#grid-data").bootgrid({
	    	navigation:2,
  			columnSelection:false,
		    ajax:true,
		    url:"getfinishprocess",
		    formatters: {
		    "processinstanceid": function(column, row){
		    	return row.worktask.processinstanceid;
		    },
		    "content":function(column, row){
		    	return row.worktask.content;
		    },
		    "type":function(column, row){
		    	return row.worktask.type;
		    },
		    "style":function(column, row){
		    	return row.worktask.style;
		    },
		    "commands": function(column, row)
		    {
		            return "<button class=\"btn btn-xs btn-default ajax-link command-run1\" data-row-id=\"" + row.worktask.processinstanceid + "\">查看详情</button>";
		    }
	    	}
	    
	    }).on("loaded.rs.jquery.bootgrid", function()
	    		{
	    	    grid.find(".command-run1").on("click", function(e)
	    	    {
	    	    	$("#processinfo").modal();
	    	    	var processinstanceid=$(this).data("row-id");
	    	    	$("#activity").html("<tr><th>活动名称</th><th>活动类型</th><th>办理人</th></tr>");
	    	    	$.post("processinfo",{"instanceid":processinstanceid},function(data){
	    	    		for(var a=0;a<data.length;a++)
	    	    			$("#activity").append("<tr><td>"+data[a].activityName+"</td><td>"+data[a].activityType+"</td><td>"+data[a].assignee+"</td></tr>");
	    	    	});
	    	    	
	    	    });
	    
	    
	    });
	  });
	  
	   function getLocalTime(nS) {  
 return new Date(parseInt(nS)).toLocaleString().replace(/:\d{1,2}$/,' ');  
}
  
    </script>
<div id="processinfo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">流程活动记录</h4>
      </div>
      <div class="modal-body">
				<table id="processdata"
					class="table table-condensed table-hover table-striped">
					<thead id="activity">
						
					</thead>
				</table>
			</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>