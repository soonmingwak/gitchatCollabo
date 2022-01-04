<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href='fullcalendar/core/main.css' rel='stylesheet' />
<link href='fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='fullcalendar/timegrid/main.min.css' rel='stylesheet' />
<script src='fullcalendar/core/main.js'></script>
<script src='fullcalendar/daygrid/main.js'></script>
<script src="fullcalendar/interaction/main.min.js"></script>
<script src="fullcalendar/timegrid/main.min.js"></script></head>
<body>


	<form name = "calendarFrm" id="calendarFrm" action="" method="GET">
		<input type ="hidden" name ="year" value="${today_info.search_year}" />
		<input type ="hidden" name ="month" value="${today_info.search_month-1}" />
		<script>
			
		
			
		</script>
		<div class="calendar">
			<div class="navigation">
				<a class="before_after_year" href="./calendar.do?year=${today_info.search_year-1 }&month=${today_info.search_month-1}"></a>
				
			</div>
		</div>
	</form>



</body>
</html>
