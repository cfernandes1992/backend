
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.min.js"></script>
</head>
<body>
    <div id="calendar"></div>
</body>

<script >

    document.addEventListener('DOMContentLoaded', function () {
        var calendarEl = document.getElementById('calendar');
     
        var calendar = new FullCalendar.Calendar(calendarEl, {
            events: 'Events2',
            color: 'yellow',   // an option!
            textColor: 'black' // an option!
        });

        calendar.render();
    });
</script>

</html>
