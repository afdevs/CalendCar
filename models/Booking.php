<?php 
class Booking{
    protected $bk_id;
	protected $bk_date_creation;
	protected $bk_u_rn;
    protected $bk_type;
    protected $db;

	public function __construct($db){
		if($this->db===null){
            $this->db=$db;
        }
	}

	public function getBookings(){
		$res=$this->db->query("SELECT * FROM booking");
		return $res->fetchAll();
	}

	public function getBooking($id){        
		$req= $this->db->prepare("SELECT * FROM booking WHERE bk_id=:id");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();
        return $req->fetch();
	}

	//GETTER
	public function getBk_id():int{
		return $this->bk_id;
	}
	
	public function getBk_date_creation():date{
		return $this->bk_date_creation;
	}

	public function getBk_u_rn():int{
		return $this->bk_u_rn;
	}

	public function getBk_type():string{
		return $this->bk_type;
	}
}
?>