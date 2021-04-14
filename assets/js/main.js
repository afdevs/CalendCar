jQuery(function($){
    $(document).ready(function(){
        let oldBk_id, oldGc_id, oldDate_start, oldDate_end, oldArrival_place, oldNb;
        
        let date = new Date();
        today=date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+date.getDate();
        
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {  
            headerToolbar: {
                left: 'timeGridDay,timeGridWeek,dayGridMonth' /*listWeek*/,
                center: 'title',
                right: 'today prev,next'
            },
            
            buttonText: {
                today: 'Aujourd\'hui',
                month: 'Mois',
                week: 'Semaine',
                day: 'Jour'
            },
            // customize the button names,
            // otherwise they'd all just say "list"
            // views: {
            //   listDay: { buttonText: 'list day' },
            //   listWeek: { buttonText: 'list week' }
            // },
            locale: 'fr',
            allDaySlot: false,
            slotLabelFormat:{
                hour: 'numeric',
                hours12: false,
                minute: '2-digit',
                omitZeroMinute: true,
                meridiem: false
            },
            initialView: 'timeGridWeek', //initialView: 'listWeek',
            initialDate: today,
        nowIndicator: true,
            navLinks: true, // can click day/week names to navigate views
            editable: true,
            selectable: true,
            selectMirror: true,
            select: function({start, end}) {
                $('#ModalAdd #date_debut').val(moment(start).format('YYYY-MM-DD HH:mm:ss'));                
                $('#ModalAdd #date_fin').val(moment(end).format('YYYY-MM-DD HH:mm:ss'));
                $('#ModalAdd').modal('show');            
                calendar.unselect()
            },
            dayMaxEvents: true, // allow "more" link when too many events,
            eventClick:function({event}){
                oldBk_id=event._def.extendedProps.lb_bk_id;
                oldGc_id=event._def.extendedProps.lb_gc_id;
                oldDate_start=moment(event.start).format("YYYY-MM-DD HH:mm:ss");
                oldDate_end=moment(event.end).format("YYYY-MM-DD HH:mm:ss");
                oldArrival_place=event.title;
                oldNb=event._def.extendedProps.lb_nb;
				$('#ModalEdit #Ubookings').val(event._def.extendedProps.lb_bk_id);				
				$('#ModalEdit #Uarrival_place').val(event.title);				
				$('#ModalEdit #Unb').val(event._def.extendedProps.lb_nb);				
				$('#ModalEdit #Udate_debut').val(moment(event.start).format("YYYY-MM-DD HH:mm:ss"));				
				$('#ModalEdit #Udate_fin').val(moment(event.end).format("YYYY-MM-DD HH:mm:ss"));
				$('#ModalEdit #Ugears').val(event._def.extendedProps.lb_gc_id);
				$('#ModalEdit').modal('show');
			},
            events: 'services/api.php?req=lineBookings'
        });

        calendar.render();



        //SCRIPTS TO THE API RESTFUL OF THE APP
        //Add reservation        
		$("button#addReservation").click(function(){
			const bookingSelected=$('#bookings').val();
			const debut=$('#date_debut').val();
			const fin=$('#date_fin').val();
			const arrival_place=$('#arrival_place').val();
			const nb=$('#nb').val();
			// var prix=$('#price').val();
			const gearSelected=$('#gears').val();

            const param='?req=addReservation';
            
			$.ajax({
                url: `services/api.php${param}`,
                type: "POST",
                data: {bk_id: bookingSelected, gc_id: gearSelected, date_start:
                    debut, date_end: fin, arrival_place: arrival_place, nb: nb},
                success: function(res) {
                    calendar.refetchEvents();
                    if(parseInt(res)===1){    
                        $('#bookings option[value="1"]').attr("selected", true);
                        $('#date_debut').val('');
                        $('#date_fin').val('');
                        $('#arrival_place').val('');
                        $('#nb').val('2');
                        $('#gears option[value="1"]').attr("selected", true);
                        $('#ModalAdd').modal('hide');
                    }            
                }
			});	
		});

        //Update Reservation
        $("button#updateReservation").click(function(){
			const bookingSelected=$('#Ubookings').val();
			const debut=$('#Udate_debut').val();
			const fin=$('#Udate_fin').val();
			const arrival_place=$('#Uarrival_place').val();
			const nb=$('#Unb').val();
			const gearSelected=$('#Ugears').val();

            const param='?req=updateReservation';
			$.ajax({
                url: `services/api.php${param}`,
                type: "POST",
                data: {bk_id: bookingSelected, gc_id: gearSelected, date_start:
                    debut, date_end: fin, arrival_place: arrival_place, nb: nb, oldBk_id, oldGc_id, oldDate_start, oldDate_end, oldArrival_place, oldNb},
			    success: function(res) {
                    calendar.refetchEvents();	
                    if(parseInt(res)===1){  
                        $('#Ubookings option[value="1"]').attr("selected", true);
                        $('#Udate_debut').val('');
                        $('#Udate_fin').val('');
                        $('#Uarrival_place').val('');
                        $('#Unb').val('2');
                        $('#Ugears option[value="1"]').attr("selected", true); 
                        $('#ModalEdit').modal('hide'); 
                    }
				}
			});	
			
		})

        //Delete Reservation
        $("button#deleteReservation").click(function(){ 
            const param='?req=deleteReservation';
			$.ajax({
                url: `services/api.php${param}`,
                type: "POST",
                data: {oldBk_id, oldGc_id, oldDate_start, oldDate_end, oldArrival_place, oldNb},
			    success: function(res) {
                    calendar.refetchEvents();
                    if(parseInt(res)===1){  
                        $('#Ubookings option[value="1"]').attr("selected", true);
                        $('#Udate_debut').val('');
                        $('#Udate_fin').val('');
                        $('#Uarrival_place').val('');
                        $('#Unb').val('2');
                        $('#Ugears option[value="1"]').attr("selected", true); 
                        $('#ModalEdit').modal('hide');
                    }
                    //location.reload();
				}
			
		    })    
        })
    });
});