<?php 
class LineBooking{
    protected $lb_bk_id;
	protected $lb_gc_id;
	protected $lb_date_start;
    protected $lb_date_end;
    protected $lb_arrival_place;
    protected $lb_nb;
    protected $db;

	public function __construct($db){
		if($this->db===null){
            $this->db=$db;
        }
	}

    public function getLineBookings(){        
		$res=$this->db->query("SELECT * FROM line_booking");
		return $res->fetchAll();
    }

    
    public function addLineBooking(int $lb_bk_id, int $lb_gc_id, $lb_date_start, $lb_date_end, string $lb_arrival_place, int $lb_nb){
        $req=$this->db->prepare("INSERT INTO line_booking SET lb_bk_id=:lb_bk_id, lb_gc_id=:lb_gc_id, lb_date_start=:lb_date_start, lb_date_end=:lb_date_end, lb_arrival_place=:lb_arrival_place, lb_nb=:lb_nb") ;
        
        $req->bindValue(':lb_bk_id',$lb_bk_id, PDO::PARAM_INT);
        $req->bindValue(':lb_gc_id', $lb_gc_id, PDO::PARAM_INT);
        $req->bindValue(':lb_date_start', $lb_date_start);
        $req->bindValue(':lb_date_end', $lb_date_end);
        $req->bindValue(':lb_arrival_place', $lb_arrival_place, PDO::PARAM_STR);
        $req->bindValue(':lb_nb', $lb_nb, PDO::PARAM_INT);
        
        return $req->execute();
    }
    
    public function updateLineBooking($lb_bk_id, $lb_gc_id, $lb_date_start, $lb_date_end, string $lb_arrival_place, int $lb_nb, $oldLb_bk_id, $oldLb_gc_id, $OldLb_date_start, $oldLb_date_end, string $oldLb_arrival_place, int $oldLb_nb){

        $req=$this->db->prepare("UPDATE line_booking SET lb_bk_id=:lb_bk_id, lb_gc_id=:lb_gc_id, lb_date_start=:lb_date_start, lb_date_end=:lb_date_end, lb_arrival_place=:lb_arrival_place, lb_nb=:lb_nb WHERE lb_bk_id=:oldLb_bk_id AND lb_gc_id=:oldLb_gc_id AND lb_date_start=:OldLb_date_start AND lb_date_end=:oldLb_date_end AND lb_arrival_place=:oldLb_arrival_place AND lb_nb=:oldLb_nb") ;
        
        $req->bindValue(':lb_bk_id',$lb_bk_id, PDO::PARAM_INT);
        $req->bindValue(':lb_gc_id', $lb_gc_id, PDO::PARAM_INT);
        $req->bindValue(':lb_date_start', $lb_date_start);
        $req->bindValue(':lb_date_end', $lb_date_end);
        $req->bindValue(':lb_arrival_place', $lb_arrival_place, PDO::PARAM_STR);
        $req->bindValue(':lb_nb', $lb_nb, PDO::PARAM_INT);

        $req->bindValue(':oldLb_bk_id', $oldLb_bk_id, PDO::PARAM_INT);
        $req->bindValue(':oldLb_gc_id', $oldLb_gc_id, PDO::PARAM_INT);
        $req->bindValue(':OldLb_date_start', $OldLb_date_start, PDO::PARAM_STR);
        $req->bindValue(':oldLb_date_end', $oldLb_date_end, PDO::PARAM_STR);
        $req->bindValue(':oldLb_arrival_place', $oldLb_arrival_place, PDO::PARAM_STR);
        $req->bindValue(':oldLb_nb', $oldLb_nb, PDO::PARAM_INT);    
        return $req->execute();
    }

    public function deleteLineBooking($oldLb_bk_id, $oldLb_gc_id, $OldLb_date_start, $oldLb_date_end, string $oldLb_arrival_place, int $oldLb_nb){
        $req=$this->db->prepare("DELETE FROM line_booking WHERE lb_bk_id=:oldLb_bk_id AND lb_gc_id=:oldLb_gc_id AND lb_date_start=:OldLb_date_start AND lb_date_end=:oldLb_date_end AND lb_arrival_place=:oldLb_arrival_place AND lb_nb=:oldLb_nb") ;
        
        $req->bindValue(':oldLb_bk_id', $oldLb_bk_id, PDO::PARAM_INT);
        $req->bindValue(':oldLb_gc_id', $oldLb_gc_id, PDO::PARAM_INT);
        $req->bindValue(':OldLb_date_start', $OldLb_date_start, PDO::PARAM_STR);
        $req->bindValue(':oldLb_date_end', $oldLb_date_end, PDO::PARAM_STR);
        $req->bindValue(':oldLb_arrival_place', $oldLb_arrival_place, PDO::PARAM_STR);
        $req->bindValue(':oldLb_nb', $oldLb_nb, PDO::PARAM_INT);    
        return $req->execute();
    }

}
?>