<!DOCTYPE html>
<html>
   
<head>
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@fullcalendar/core@5.11.0/main.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@5.11.0/main.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@5.11.0/main.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@5.11.0/main.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/interaction@5.11.0/main.min.js"></script>
  
  
  
  
</head>
 <%@ include file = "Header.jsp"%>
<body>
    <div style="width: 80%; margin-left: 10%; margin-top: 20px;">
     <div id="calendar" style="height: 80%;"></div>
     
     <div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="eventModalLabel">Event Details</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p id="eventDetails"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
    </div>
</body>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            weekends: false,
            fixedWeekCount:false,
            timeZone: 'local',
            displayEventTime: false,
            events: 'Events2',
            eventClick: function(info) {
                var event = info.event;
                var start = event.start.toLocaleString();
                var end = event.end ? event.end.toLocaleString() : 'No end date';
          
          document.getElementById('eventDetails').innerText = 
            "Name: "+event.title+"\nStart: "+start+"\nEnd: "+end;
          
          var modal = new bootstrap.Modal(document.getElementById('eventModal'));
          modal.show();
            }
    
        });

        calendar.render();
    });
</script>
</html>