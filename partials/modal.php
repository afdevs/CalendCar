<!-- Modal ADD RESERVATION-->	
<div class="modal fade" tabindex="-1" id="ModalAdd" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Nouveau resevation</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<!-- <div class="col-sm-12">
						<?php // $frm->textarea('description','Description'); ?>				
					</div>		 -->
					
					<div class="col-sm-12">
						<div class="form-group">
							<label for="bookings" class="control-label">Booking: </label>
							<select name="bookings" id="bookings" class="form-control">
								<?php foreach ($managerBooking->getBookings() as $key => $booking) {
								?>
									<option value="<?= $booking['bk_id'] ?>">
										<?= $booking['bk_type'].' - '.$booking['bk_date_creation'] ?>
									</option>
								<?php
								} 
								?>
							</select>
						</div>
					</div>

					<div class="col-sm-8">
						<?= $frm->inputText('arrival_place','Lieu d\'arrivée:'); ?>	
					</div>
					<div class="col-sm-4"> 
						<?= $frm->inputNumber('nb','Nombre:'); ?>	
					</div>

					<div class="col-sm-12">
						<div class="form-group">
							<label for="gears" class="control-label">Gears: </label>
							<select name="gears" id="gears" class="form-control">
								<?php foreach ($managerGear->getGears() as $keys => $gear) {
								?>
									<option value="<?= $gear['gearCarId'] ?>">
										<?= $gear['gb_brand'].' ('.$gear['gc_model'].') - '.$gear['g_year']; ?>
									</option>
								<?php
								} 
								?>
							</select>
						</div>
					</div>

					<!-- <div class="col-sm-12"> -->
						<?php // $frm->inputNumber('price','Prix:'); ?>	
					<!-- </div> -->

					<div class="col-sm-6">
						<?php echo $frm->inputText('date_debut', 'Le'); ?>
					</div>
					<div class="col-sm-6">
						<?php echo $frm->inputText('date_fin', 'Jusqu\'à'); ?>
					</div>			
					<!-- <div class="col-sm-12">
						<div class="form-group">
							<label for="color" class="control-label"> Couleur de la réservation:</label>
							<div class="">
								<select name="color" class="form-control" id="color">
									<option value="">Choisir</option>
									<option style="color:#0071c5;" value="#0071c5">&#9724; Dark blue</option>
									<option style="color:#40E0D0;" value="#40E0D0">&#9724; Turquoise</option>
									<option style="color:#008000;" value="#008000">&#9724; Green</option>	
									<option style="color:#FFD700;" value="#FFD700">&#9724; Yellow</option>
									<option style="color:#FF8C00;" value="#FF8C00">&#9724; Orange</option>
									<option style="color:#FF0000;" value="#FF0000">&#9724; Red</option>
									<option style="color:#000;" value="#000">&#9724; Black</option>
								</select>
							</div>
						</div>
					</div> -->
				</div>										
			</div>		      	    					
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
				<button type="button" class="btn btn-primary" name="addReservation" id="addReservation">Enregistrer</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal UPDATE RESERVATION-->	
<div class="modal fade" tabindex="-1" id="ModalEdit" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Modifier resevation</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
			</div>
			
			<div class="modal-body">
				<div class="row">					
					<div class="col-sm-12">
						<div class="form-group">
							<label for="Ubookings" class="control-label">Booking: </label>
							<select name="Ubookings" id="Ubookings" class="form-control">
								<?php 
									foreach ($managerBooking->getBookings() as $key => $booking) {
								?>
									<option value="<?= $booking['bk_id'] ?>">
										<?= $booking['bk_type'].' - '.$booking['bk_date_creation'] ?>
									</option>
								<?php
								}
								?>
							</select>
						</div>
					</div>
					<div class="col-sm-8">
						<?= $frm->inputText('Uarrival_place','Lieu d\'arrivée:'); ?>	
					</div>
					<div class="col-sm-4"> 
						<?= $frm->inputNumber('Unb','Nombre:'); ?>	
					</div>

					<div class="col-sm-12">
						<div class="form-group">
							<label for="Ugears" class="control-label">Gears: </label>
							<select name="Ugears" id="Ugears" class="form-control">
								<?php foreach ($managerGear->getGears() as $keys => $gear) {
								?>
									<option value="<?= $gear['gearCarId'] ?>">
										<?= $gear['gb_brand'].' ('.$gear['gc_model'].') - '.$gear['g_year']; ?>
									</option>
								<?php
								} 
								?>
							</select>
						</div>
					</div>

					<div class="col-sm-6">
						<?php echo $frm->inputText('Udate_debut', 'Le'); ?>
					</div>
					<div class="col-sm-6">
						<?php echo $frm->inputText('Udate_fin', 'Jusqu\'à'); ?>
					</div>
				</div>										
			</div>		      	    					
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" name="deleteReservation" id="deleteReservation">Supprimer</button>
				<button type="button" class="btn btn-primary" name="updateReservation" id="updateReservation">Enregistrer</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->