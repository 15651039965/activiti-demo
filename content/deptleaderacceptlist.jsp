<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
      
            <div class="container-fluid">
                       <div class="row">
                    <div class="col-lg-12">
                    <div class="box ui-draggable ui-droppable">
				<div class="box-header">
					<div class="box-name">
						<i class="fa fa-coffee"></i> <span>项目经理验收</span>
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
						<i class="fa fa-search"></i> <span>项目经理验收</span>
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
						                <input class="form-control" id="tasktype" readonly="readonly">
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
		    url:"deptaccepttasklist",
		    formatters: {
		    "commands": function(column, row)
		    {
		            return "<button class=\"btn btn-xs btn-default ajax-link command-run1\" data-row-id=\"" + row.taskId + "\">详情</button>";
		    }
	    	}
	    
	    }).on("loaded.rs.jquery.bootgrid", function()
	    		{
	    	    grid.find(".command-run1").on("click", function(e)
	    	    {
	    	    	var taskId=$(this).data("row-id");
	    	    	$.post("dealtask",{"taskId":taskId},function(data){
	    	    		$("#taskid").val(data.taskid);
	    	    		$("#channel").val(data.channel);
	    	    		$("#tasktype").val(data.tasktype);
	    	    		$("#begintime").val(data.begintime);
	    	    		$("#endtime").val(data.endtime);
	    	    		$("#roadid").val(data.road.roadname);
	    	    		$("#postype").val(data.postype);
	    	    		$("#type").val(data.type);
	    	    		$("#style").val(data.style);
	    	    		$("#file").val(data.file);
	    	    		$("#publishname").val(data.publishname);
	    	    		$("#publishdate").val(data.publishdate);
	    	    		$("#buildname").val(data.buildname);
	    	    		$("#builddate").val(data.builddate);
	    	    		$("#epicture").val(data.epicture);
	    	    			    	  	
	    	    		
	    	    		$("form").attr("action","task/deptleaderacceptcomplete/"+taskId);
	    	    	});
	    	    	$("#dept").show();
	    	    	$("#btn").click(function(){
	    		    	$.post("task/deptleaderacceptcomplete/"+taskId,$("form").serialize(),function(a){
	    		    		alert("项目经理验收完成");
	    		    		LoadAjaxContent("deptleaderacceptlist");
	    		    	});
	    	    	
	    	    });
	    	    });
	    
	    
	    });
	  });
	  
function getLocalTime(nS) {  
 return new Date(parseInt(nS)).toLocaleString().replace(/:\d{1,2}$/,' ');  
}
  
    </script>
