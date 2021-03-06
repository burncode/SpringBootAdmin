<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>菜单列表</title>
    <%@include file="/WEB-INF/views/common/css.jsp" %>
</head>
<body class="main-bg">
<sys:message type="${type}" content="${content}"></sys:message>
<div class="container-fluid">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="row">
            <div class="search_panel">
                <div class="search_content">
                    <form:form id="searchForm" modelAttribute="log" action="${ctx}/log/findAll" method="post"
                               class="form-inline">
                        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                        <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

                        <div class="row">
                            <div class="form-group  col-xs-6 col-md-4">
                                <label for="beginDate">开始时间</label>
                                <div class="input-prepend input-group">
                                    <span class="add-on input-group-addon"><i
                                            class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                    <input type="text" class="form-control" id="beginDate"
                                           onfocus="WdatePicker({skin:'whyGreen'})">
                                </div>
                            </div>
                            <div class="form-group  col-xs-6 col-md-4">
                                <label for="beginDate">结束时间</label>
                                <div class="input-prepend input-group">
                                    <span class="add-on input-group-addon"><i
                                            class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                    <input type="text" class="form-control" id="endDate"
                                           onfocus="WdatePicker({skin:'whyGreen'})">
                                </div>
                            </div>
                            <div class="form-group col-xs-6 col-md-4">
                                <label for="type">日志类型</label>
                                <form:select path="type" class="form-control">
                                    <form:option value="">请选择</form:option>
                                    <form:option value="1">操作日志</form:option>
                                    <form:option value="2">异常日志</form:option>
                                </form:select>
                                <button type="submit" class="btn btn-success">查询</button>
                            </div>

                        </div>

                    </form:form>
                </div>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>

    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="row">
            <div class="table_panel">
                <div class="table_title">
                    <h2><i class="glyphicon glyphicon-th-large"></i>日志管理</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="table_content">
                    <!--data table-->
                    <table id="dataTable" class="table table-striped table-bordered jambo_table bulk_action" cellspacing="0"
                           width="100%">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="check-all" class="flat">
                            </th>
                            <th class="column-title">日志类型</th>
                            <th class="column-title">创建时间</th>
                            <th class="column-title">访问IP</th>
                            <th class="column-title">客户端</th>
                            <th class="column-title">请求链接</th>
                            <th class="column-title">请求方法</th>
                            <th class="column-title">请求参数</th>
                            <th class="column-title">响应信息</th>
                            <th class="bulk-actions" colspan="8">
                                <a class="antoo" style="color:#fff; font-weight:500;">( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="log" items="${page.result}">
                            <tr>
                                <td>
                                    <input type='checkbox' class='flat' name='item' value='${log.logId}'/>
                                </td>
                                <td>${log.type}</td>
                                <td>${log.createDate}</td>
                                <td>${log.remoteAddr}</td>
                                <td>${log.userAgent}</td>
                                <td>${log.requestUri}</td>
                                <td>${log.method}</td>
                                <td>${log.params}</td>
                                <td>${log.response}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="page">${page}</div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/views/common/js.jsp" %>
<script type="text/javascript">

    function page(n, s) {
        if (n) $("#pageNo").val(n);
        if (s) $("#pageSize").val(s);
        $("#searchForm").attr("action", "${ctx}/log/findAll");
        $("#searchForm").submit();
        return false;
    }
</script>


</body>
</html>